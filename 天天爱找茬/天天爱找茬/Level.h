//
//  Level.h
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject
{
    int level;
    BOOL steps[8];
}
-(int) level;
-(void) setStep:(int) Index Pass:(BOOL) pass;
-(BOOL) stepsAtIndex:(int) Index;
-(instancetype) initWithLevel:(int) oneLevel Steps:(unsigned char) Steps;
-(instancetype) initWithLevel:(int) oneLevel;
-(unsigned char) toSteps;
@end
