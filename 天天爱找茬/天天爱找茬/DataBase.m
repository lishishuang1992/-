//
//  DataBase.m
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "DataBase.h"
#import "DocumentPath.h"
@implementation DataBase
+(Images *) readImages:(int) fileName
{
    return [[Images alloc]initImageWithName:fileName];
}

+(void) writeImage:(int) fileName Image_A:(NSData *) Image_A Image_B:(NSData *) Image_B
{
    [Image_A writeToFile:[DocumentPath Floder:@"下载" FileName:[NSString stringWithFormat:@"%d_A.jpg",fileName]] atomically:NO];
     [Image_B writeToFile:[DocumentPath Floder:@"下载" FileName:[NSString stringWithFormat:@"%d_B.jpg",fileName]] atomically:NO];
}
@end
