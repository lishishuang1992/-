//
//  SecondViewController.h
//  天天爱找茬
//
//  Created by 李世爽 on 16/4/30.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "secondView.h"
@interface SecondViewController : UIViewController<secondViewDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate>
{
    int count;
}
@property(strong,nonatomic)NSMutableArray *xyArray;
-(void)reloadData;
@end
