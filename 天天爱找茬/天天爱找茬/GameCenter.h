//
//  GameCenter.h
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Images.h"
#import "Level.h"

@interface GameCenter : NSObject
-(instancetype) init;
-(Level *) getCurrentLevel;
-(void) moveToNextLevel;
-(void) moveToLastLevel;
-(Images *) startGame;
-(void) setCurrentLevel:(int) level Step:(int) step;
-(void) setCurrentValue:(BOOL) value;
-(BOOL) judgePoint:(float) X Y:(float) Y;
-(void) moveToNextGame;
-(int) update;
-(void) contactUs;
-(void) changeVoiceState;
-(void) saveData;
-(NSString *) description;
@end
