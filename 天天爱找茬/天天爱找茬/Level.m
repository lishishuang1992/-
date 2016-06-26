//
//  Level.m
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "Level.h"

@implementation Level

-(instancetype) initWithLevel:(int) oneLevel Steps:(unsigned char) Steps
{
    self=[super init];
    if(self)
    {
        level=oneLevel;
        char time=0;
        do
        {
            steps[time]=(Steps&1);
            Steps>>=1;
            time++;
        }while (time<8);
    }
    return  self;
}

-(instancetype) initWithLevel:(int) oneLevel
{
    self=[super init];
    if(self)
    {
        level=oneLevel;
        for (int i=0; i<8; i++)
            steps[i]=0;
    }
    return  self;
}

-(int) level
{
    return level;
}

-(BOOL) stepsAtIndex:(int) Index
{
    if (Index>-1&&Index<8)
        return steps[Index];
    return NO;
}

-(void) setStep:(int) Index Pass:(BOOL) pass
{
    if(!steps[Index])
    {
        steps[Index]=pass;
    }
}

-(unsigned char) toSteps
{
    unsigned char step=0;
    for (int i=7; i>-1; i--)
    {
        step<<=1;
        step+=steps[i];
    }
    return step;
}
@end
