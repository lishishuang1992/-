//
//  GameCenter.m
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "GameCenter.h"
#import "UserData.h"
#import "DataBase.h"

@interface GameCenter()
{
    UserData *user;
}
@end

@implementation GameCenter
static NSString *information=@"天天爱找茬 1.0";
static GameCenter * instance;

-(instancetype)init
{
    if (!instance)
    {
        instance= [super init];
        if (instance)
            user=[[UserData alloc]initFromFile];
    }
    return instance;
}

-(void) setCurrentLevel:(int) level Step:(int) step
{
    [user setCurrentLevel:level Step:step];
}

-(Level *) getCurrentLevel
{
    return [user getCurrentLevel];
}

-(void) setCurrentValue:(BOOL) value
{
    [user setCurrentStep:value];
}

-(void) moveToNextGame
{
    [user moveToNextGame];
}

-(void) moveToNextLevel
{
    [user moveToNextLevel];
}

-(void) moveToLastLevel
{
    [user moveToLastLevel];
}

-(void) changeVoiceState
{
    [user mute];
}

-(Images *) startGame
{
    return [DataBase readImages:[user getImageStep]];
}

-(NSString *) description
{
    return information;
}

-(void) saveData
{
    [user writeToFile];
}

-(BOOL) judgePoint:(float) X Y:(float) Y
{
    //判断逻辑点。
    return NO;
}

-(int) update
{
    //连接服务器进行更新。
    return 0;
}

-(void) contactUs
{
    //邮件API
}
@end
