//
//  DataBase.h
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Images.h"
@interface DataBase : NSObject
+(Images *) readImages:(int) fileName;
+(void) writeImage:(int) fileName Image_A:(NSData *) Image_A Image_B:(NSData *) Image_B;
@end
