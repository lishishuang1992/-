//
//  Images.m
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "Images.h"
#import "DocumentPath.h"
@implementation Images
@synthesize one;
@synthesize another;

-(instancetype)initImageWithName:(int) name
{
    self=[super init];
    if (self)
    {
        if (name>0&&name<25)
        {
            one=(id)[[UIImage imageNamed:[NSString stringWithFormat:@"%d_A.jpg",name]]  CGImage];
            another=(id)[[UIImage imageNamed:[NSString stringWithFormat:@"%d_B.jpg",name]]  CGImage];
        }
        else
        {
            one=(id)[[UIImage imageWithContentsOfFile:[DocumentPath Floder:@"下载" FileName:[NSString stringWithFormat:@"%d_A.jpg",name]]]  CGImage];
            another=(id)[[UIImage imageWithContentsOfFile:[DocumentPath Floder:@"下载" FileName:[NSString stringWithFormat:@"%d_B.jpg",name]]]  CGImage];
        }
    }
    return self;
}

-(void) setImageWithName:(int) name
{
    if (name>0&&name<25)
    {
        one=(id)[[UIImage imageNamed:[NSString stringWithFormat:@"%d_A.jpg",name]]  CGImage];
        another=(id)[[UIImage imageNamed:[NSString stringWithFormat:@"%d_B.jpg",name]]  CGImage];
    }
    else
    {
        one=(id)[[UIImage imageWithContentsOfFile:[DocumentPath Floder:@"下载" FileName:[NSString stringWithFormat:@"%d_A.jpg",name]]]  CGImage];
        another=(id)[[UIImage imageWithContentsOfFile:[DocumentPath Floder:@"下载" FileName:[NSString stringWithFormat:@"%d_B.jpg",name]]]  CGImage];
    }
}
@end
