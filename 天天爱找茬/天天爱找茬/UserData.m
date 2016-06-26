//
//  UserData.m
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "UserData.h"
#import "DocumentPath.h"

@implementation UserData
-(Level *) getCurrentLevel
{
    return array[currentLevel];
}

-(void) setCurrentLevel:(int) Index Step:(int)step
{
    currentLevel=Index;
    currentStep=step;
}

-(int) getCurrentStep
{
    return currentStep;
}

-(int) getImageStep
{
    return (currentLevel<<3)+currentStep;
}

-(void) setCurrentStep:(BOOL)value
{
    [array[currentLevel] setStep:currentStep Pass:value];
}

-(void) moveToNextGame
{
    currentStep++;
    if (currentStep>7)
        [self moveToNextLevel];
}

-(void) moveToNextLevel
{
    ++currentLevel;
    currentLevel%=array.count;
    currentStep=0;
}

-(void) moveToLastLevel
{
    --currentLevel;
    currentLevel+=array.count;
    currentLevel%=array.count;
    currentStep=0;
}

-(BOOL) writeToFile
{
    NSMutableArray *content=[[NSMutableArray alloc]init];
    [content addObject:[NSNumber numberWithInt:currentLevel]];
    [content addObject:[NSNumber numberWithInt:currentStep]];
    [content addObject:[NSNumber numberWithInt:mute]];
    for (int i=0; i<array.count; i++)
        [content addObject:[NSNumber numberWithUnsignedChar:[array[i] toSteps]]];
    return [content writeToFile:[DocumentPath Floder:@"系统" FileName:@"UserData"] atomically:NO];
}

-(instancetype) initFromFile
{
    self=[super init];
    if (self)
    {
        NSArray *content=[[NSArray alloc]initWithContentsOfFile:[DocumentPath Floder:@"系统" FileName:@"UserData"]];
        if (content)
        {
            currentLevel=[(NSNumber *)content[0] intValue];
            currentStep=[(NSNumber *)content[1] intValue];
            mute=[(NSNumber *)content[2] intValue];
            array=[[NSMutableArray alloc]init];
            for (int i=3; i<content.count; i++)
            {
                [array addObject:[[Level alloc]initWithLevel:i-3 Steps:[(NSNumber *)content[i] unsignedCharValue]]];
            }
        }
        else
        {
            currentLevel=1;
            currentStep=1;
            mute=1;
            array=[[NSMutableArray alloc]init];
            for (int i=0; i<3; i++)
                [array addObject:[[Level alloc]initWithLevel:i]];
        }
    }
    return self;
}

-(void) mute
{
    mute=1-mute;
}

-(BOOL) isMute
{
    return mute;
}
@end
