//
//  playMusic.h
//  天天爱找茬
//
//  Created by 李世爽 on 16/6/11.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@interface playMusic : NSObject

-(void)backgroundMusic:(NSString*)musicName;
-(void)buttonMusic:(NSString*)musicName;
-(void)play;
-(void)stop;

@end
