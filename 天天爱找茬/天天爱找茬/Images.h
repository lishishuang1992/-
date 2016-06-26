//
//  Images.h
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Images : NSObject
@property (strong,nonatomic) id one;
@property (strong,nonatomic) id another;
-(instancetype)initImageWithName:(int) name;
-(void) setImageWithName:(int) name;
@end
