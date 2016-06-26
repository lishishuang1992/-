//
//  RootViewController.m
//  天天爱找茬
//
//  Created by 李世爽 on 16/4/30.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    SecondViewController *secondVC;
}
@end

@implementation RootViewController
{
   NSMutableData *mydata;
    UIView *paiming;
    GameCenter *gameCenter;
    RootView *rootView;
    UITextField *username;
    UITextField *password;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    paiming = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    paiming.backgroundColor = [UIColor whiteColor];
    username = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    username.backgroundColor = [UIColor grayColor];
    password = [[UITextField alloc] initWithFrame:CGRectMake(0, 130, 300, 100)];
    password.backgroundColor = [UIColor grayColor];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 400, 50, 50)];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(toggleButton) forControlEvents: UIControlEventTouchUpInside];
    [paiming addSubview:button ];
    [paiming addSubview:username];
    [paiming addSubview:password];
    
    
    [paiming setHidden:YES];
     secondVC = [[SecondViewController alloc] init];
    //self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"Home.png"]];
    gameCenter = [[GameCenter alloc] init];
     [self.navigationController setNavigationBarHidden:YES animated:NO];
    rootView = [[RootView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    rootView.delegate = self;
    [self.view addSubview:rootView];
    [self.view addSubview:paiming];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//开始请求Web Service


    




-(void)toggleButton{
    
    
    NSString *strURL  = [NSString stringWithFormat:@"http://127.0.0.1:8000/admin/home/username%@password%@/", username.text, password.text];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:strURL]
    ;
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
        mydata  = [NSMutableData new];
    }


}
#pragma mark - NSURLConnectDelegate
-(void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data{
    
    [mydata appendData:data];
    NSLog(@"_______data:_______:%@",mydata);
  
}




#pragma mark - RootViewDelegate


-(void)updateButtonClicked{
    
}

-(void)rankingButtonClicked{
    [paiming setHidden:NO];
    
    
    
}

-(void)contactUsButtonClicked{

}

-(void)addButtonClicked{
    [gameCenter moveToNextLevel];
    [rootView setNeedsDisplay];
}

-(void)reduceButtonClicked{
    [gameCenter moveToLastLevel];
    [rootView setNeedsDisplay];

}

-(void)starButtonClicked:(NSInteger)tag{
    NSString *picturAString = [NSString stringWithFormat:@"%ld_A.jpg",(long)tag%10];
     NSString *picturBString = [NSString stringWithFormat:@"%ld_B.jpg",(long)tag%10];
    [[NSUserDefaults standardUserDefaults] setObject:picturAString forKey:@"pictureA"];
    [[NSUserDefaults standardUserDefaults] setObject:picturBString forKey:@"pictureB"];
    [secondVC reloadData];
    [self.navigationController pushViewController:secondVC animated:YES];

}







@end
