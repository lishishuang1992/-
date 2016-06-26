//
//  RootView.m
//  天天爱找茬
//
//  Created by 李世爽 on 16/4/30.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "RootView.h"

@implementation RootView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
{
    playMusic *playmusic;
    GameCenter *gameCenter;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Home.png"]];
        [self addSubview:backgroundImageView];
        [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(0);
            make.left.equalTo(self).with.offset(0);
            make.bottom.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
        }];
        
//       转轮
        UIImageView *runnerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"runner.png"]];
        [self addSubview:runnerImageView];
        [runnerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
           // make.centerX.equalTo(self.mas_centerX).with.offset(-200);
            make.left.equalTo(self.mas_left).with.offset(70);
        }];
        

        UIButton  *rankingButton = [[UIButton alloc] init];
        rankingButton.tag = 1;
        [rankingButton setBackgroundImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
        [rankingButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        rankingButton.clipsToBounds =YES;
        [self addSubview:rankingButton ];
        [rankingButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(40);
            make.left.equalTo(self.mas_centerX).with.offset(150);
            make.bottom.equalTo(self.mas_centerY).with.offset(-200);
            make.right.equalTo(self).with.offset(-20);

            //make.height.mas_equalTo(@250);
            //make.width.mas_equalTo(@2250);
        }];
    
        UIButton  *contactUsButton = [[UIButton alloc] init];
        contactUsButton.tag = 2;
        [contactUsButton setBackgroundImage:[UIImage imageNamed:@"contactUs"] forState:UIControlStateNormal];
        [contactUsButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        contactUsButton.clipsToBounds =YES;
        [self addSubview:contactUsButton];
        [contactUsButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(rankingButton.mas_centerX);
            make.top.equalTo(rankingButton.mas_bottom).with.offset(80);
            make.height.mas_equalTo(@250);
            make.width.mas_equalTo(@300);
        }];

        UIButton  *updateButton = [[UIButton alloc] init];
        updateButton.tag = 3;
        [updateButton setBackgroundImage:[UIImage imageNamed:@"update"] forState:UIControlStateNormal];
        [updateButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        updateButton.clipsToBounds =YES;
        [self addSubview:updateButton ];
        [updateButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(contactUsButton.mas_bottom).with.offset(60);
            make.centerX.equalTo(rankingButton.mas_centerX);
            make.bottom.equalTo(self.mas_bottom).with.offset(-40);
            make.height.mas_equalTo(@230);
            make.width.mas_equalTo(@270);

        }];

        
        UIButton  *addButton = [[UIButton alloc] init];
        addButton.tag = 4;
        [addButton setBackgroundImage:[UIImage imageNamed:@"+"] forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        addButton.clipsToBounds =YES;
        [self addSubview:addButton];
        [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(100);
            make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(-130);
            
        }];
        
        UIButton  *reduceButton = [[UIButton alloc] init];
        reduceButton.tag = 5;
        [reduceButton setBackgroundImage:[UIImage imageNamed:@"-"] forState:UIControlStateNormal];
        [reduceButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        reduceButton.clipsToBounds =YES;
        [self addSubview:reduceButton ];
        [reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(-130);
            make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(100);
        }];
        
        gameCenter = [[GameCenter alloc] init];
        Level *currentLevel = [[Level alloc] init];
         currentLevel = [gameCenter getCurrentLevel];
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (int i = 0; i< 8; i++) {
            NSNumber *boolNumber = [NSNumber numberWithInt:[currentLevel stepsAtIndex:i]];
            [array  addObject: boolNumber];
        }
        int i = 10;
        for (NSNumber *levelState in array) {
            int state = [levelState intValue];
            UIButton  *star = [[UIButton alloc] init];
            star.tag = i;
            if (state==1) {
                [star setBackgroundImage:[UIImage imageNamed:@"YES"] forState:UIControlStateNormal];
            }else{
                [star setBackgroundImage:[UIImage imageNamed:@"NO"] forState:UIControlStateNormal];
            }
            [star addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            star.clipsToBounds =YES;
            [self addSubview:star];
            [star mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@50);
                make.width.equalTo(@50);
            }];
            
            if (i == 10) {
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(-8);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(-190);
                }];

            }else if (i == 11){
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(-80);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(-170);
                }];
            
            
            }
            else if (i == 12){
                
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(-137);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(-134);
                }];

                
            }
            else if (i == 13){
                
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(-168);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(-80);
                }];

                
            }
            else if (i == 14){
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(-180);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(-16);
                }];

                
                
            }else if (i == 15){
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(160);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(-40);
                }];

                
                
            }
            else if (i == 16){
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(148);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(20);
                }];

                
                
            }
            else if (i == 17){
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(118);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(80);
                }];

                
                
            }else if (i == 18){
                
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(56);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(123);
                }];

                
            }
            else {
                
                [star mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(runnerImageView.mas_centerX).with.offset(-18);
                    make.centerY.equalTo(runnerImageView.mas_centerY).with.offset(146);
                }];

                
            }
            i++;
        }
        
        
        playmusic = [[playMusic alloc] init];
        [playmusic backgroundMusic:@"backgroundMusic"];
        
        UISwitch *backgroundSwitch = [[UISwitch alloc] init];
        [backgroundSwitch setOn:YES];
        [backgroundSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:backgroundSwitch ];
        [backgroundSwitch  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(40);
            make.top.equalTo(self).with.offset(40);
        }];
        
    }
    return self;
}


-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        [playmusic play];
    }else {
        [playmusic stop];
    }
}

- (void)buttonClicked:(UIButton *)button
{
    [playmusic buttonMusic:@"button"];
    switch (button.tag)
    {
        case 1:                                     //查看排名
            if (_delegate && [_delegate respondsToSelector:@selector(rankingButtonClicked)])
            {
                [_delegate rankingButtonClicked];
                
            }
            break;
        case 2:                                     //联系我们
            if (_delegate && [_delegate respondsToSelector:@selector(contactUsButtonClicked)])
            {
                [_delegate contactUsButtonClicked];
            }
            break;
        case 3:
            //更新
            if (_delegate && [_delegate respondsToSelector:@selector(updateButtonClicked)])
            {
                [_delegate updateButtonClicked];
                NSLog(@"111");
            }
            //下一层＋
            break;
        case 4:
            if (_delegate && [_delegate respondsToSelector:@selector(addButtonClicked)])
            {
                [_delegate addButtonClicked];
                NSLog(@"111");
            }
            break;
        case 5:
            //上一层－
            if (_delegate && [_delegate respondsToSelector:@selector(reduceButtonClicked)])
            {
                [_delegate reduceButtonClicked];
                NSLog(@"111");
            }
            break;
        default:
            if (_delegate && [_delegate respondsToSelector:@selector(starButtonClicked:)])
            {
                [_delegate starButtonClicked:button.tag];
                
            }

            break;
    }
}

@end
