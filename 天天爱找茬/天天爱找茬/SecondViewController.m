//
//  SecondViewController.m
//  天天爱找茬
//
//  Created by 李世爽 on 16/4/30.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "SecondViewController.h"
#import "Masonry.h"
#import "playMusic.h"
@interface SecondViewController ()
{
    int intString;
    NSDictionary *dict;
    NSString *pictA;
    playMusic *playmusic;
    NSThread *myThread;
    secondView *secondview;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    secondview = [[secondView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    secondview.delegate = self;

    
    [self reloadData];
    UITapGestureRecognizer *singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
    //点击的次数
  
    NSString *path =  [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
    dict = [NSDictionary dictionaryWithContentsOfFile:path];

    //给self.view添加一个手势监测；
    
    [self.view addGestureRecognizer:singleRecognizer];


    count = 0;
    
    
    playmusic = [[playMusic alloc] init];
    
    myThread = [[NSThread alloc] initWithTarget:self selector:@selector(doSomething) object:nil];
    
    [myThread start];
    
}




-(void)reloadData{
    NSString *str = [pictA substringToIndex:1];
    intString = [str intValue];
     count = 0;
    pictA = [[NSUserDefaults standardUserDefaults] objectForKey:@"pictureA"];
    NSString *pictB = [[NSUserDefaults standardUserDefaults] objectForKey:@"pictureB"];
    [secondview reloadImage:pictA :pictB];
    [self.view addSubview:secondview];

    _xyArray = [dict objectForKey:pictA];
    
}



-(void)SingleTap:(UITapGestureRecognizer*)recognizer
{
    //处理单击操作
    CGPoint point = [recognizer locationInView:self.view];
    int flag = 0,i = 0;
    NSLog(@"x:%f   y:%f",point.x,point.y);
    double width= [[UIScreen mainScreen] bounds].size.width;
    for (NSArray *temp in _xyArray) {
        
        double x = [temp[0] doubleValue];
        double y = [temp[1] doubleValue];
         NSLog(@"什么情况： %f  %f     %f  %f",width/2+x,point.x,y,point.y);
        if ((x<point.x+35&&x>point.x-35)&&(y<point.y+35&&y>point.y-35)) {
            flag = 1;
            
            count = count +1;
            UIImage *image = [UIImage imageNamed:@"right.png"];
            UIImageView *errorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(point.x-60, point.y-60, 120, 120)];
            [errorImageView setImage:image];
            [self.view addSubview:errorImageView];
            
            UIImageView *errorImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(width/2+(point.x-60), point.y-60, 120, 120)];
            [errorImageView2 setImage:image];
            [self.view addSubview:errorImageView2];
            
            
        }else if((x<point.x+35-width/2)&&(x>point.x-35-width/2)&&(y<point.y+35&&y>point.y-35)){
            flag = 1;
            
            count = count +1;
            UIImage *image = [UIImage imageNamed:@"right.png"];
            UIImageView *errorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(point.x-60, point.y-60, 120, 120)];
            [errorImageView setImage:image];
            [self.view addSubview:errorImageView];
            
            UIImageView *errorImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake((point.x-60-width/2), point.y-60, 120, 120)];
            [errorImageView2 setImage:image];
            [self.view addSubview:errorImageView2];
        }
        else{
        
        }
        [playmusic buttonMusic:@"button"];
        i++;
    }
    if (flag==0) {
        UIImage *image = [UIImage imageNamed:@"error.png"];
        UIImageView *errorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(point.x-20, point.y-20, 40, 40)];
        [errorImageView setImage:image];
        errorImageView.tag = 1;
        [playmusic buttonMusic:@"error"];
        [self.view addSubview:errorImageView];
       
    }
    if (count == 5) {
        count = 0;
        NSString *msg = nil;
        msg = @"你真棒！";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:msg
                              message:nil
                              delegate:self
                              cancelButtonTitle:@"退出"
                              otherButtonTitles:@"下一关",nil];
        [alert show];
    }
}




- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
   
    NSString *pA ,*pB;
    switch (buttonIndex) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
            
        case 1:
            intString = intString+1;

            pA =[NSString stringWithFormat:@"%d_A.jpg",intString];
            pB =[NSString stringWithFormat:@"%d_B.jpg",intString];
            _xyArray = [dict objectForKey:pA];
            [secondview reloadImage:pA :pB];
            [self.view addSubview:secondview];
            break;
            
        default:
            break;
    }
    NSLog(@"buttonIndex:%ld",(long)buttonIndex);
}



- (void) doSomething

{
    
    do {
        for (UIView *subviews in [self.view subviews]) {
            if (subviews.tag==1) {
                
                [NSThread sleepForTimeInterval:0.2];
                [subviews removeFromSuperview];
            }
            NSLog(@"线程在执行");
        }

    } while (1);
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

-(void)viewWillDisappear:(BOOL)animated{
    [myThread isFinished];

}

-(void)canleButtonClicked{

    [self.navigationController popViewControllerAnimated:YES];
}
@end
