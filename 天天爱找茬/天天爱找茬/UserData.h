//
//  UserData.h
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
@interface UserData : NSObject
{
    NSMutableArray<Level *> *array;
    int currentLevel;
    int currentStep;
    BOOL mute;
}
-(Level *) getCurrentLevel;
-(void) setCurrentLevel:(int) Index Step:(int)step;
-(int) getCurrentStep;
-(int) getImageStep;
-(void) setCurrentStep:(BOOL)value;
-(void) moveToNextGame;
-(void) moveToNextLevel;
-(void) moveToLastLevel;
-(BOOL) writeToFile;
-(instancetype) initFromFile;
-(void) mute;
-(BOOL) isMute;
@end
