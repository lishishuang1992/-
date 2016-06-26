//
//  playMusic.m
//  天天爱找茬
//
//  Created by 李世爽 on 16/6/11.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "playMusic.h"

@implementation playMusic
{
    SystemSoundID buttonSound;
    AVAudioPlayer *backgroundMusic;

}


-(void)backgroundMusic:(NSString*)musicName{
    NSURL *buttonSoundUrl = [[NSBundle mainBundle] URLForResource:musicName withExtension:@"mp3"];
    backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonSoundUrl error:nil];
    backgroundMusic.numberOfLoops = -1;
    [backgroundMusic play];

}
-(void)buttonMusic:(NSString*)musicName{
    NSURL *buttonSoundUrl = [[NSBundle mainBundle] URLForResource:musicName withExtension:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonSoundUrl, &buttonSound);
    AudioServicesPlaySystemSound(buttonSound);

}
-(void)stop{
    [backgroundMusic stop];
}
-(void)play{
    [backgroundMusic play];
}
@end
