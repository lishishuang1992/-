//
//  secondView.m
//  天天爱找茬
//
//  Created by 李世爽 on 16/4/30.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "secondView.h"
@implementation secondView
{


    UIImageView *photoFrameImageView;
    UIButton *canleButton;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
       photoFrameImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phontFrame.png"]];
        [self addSubview:photoFrameImageView];
        [photoFrameImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(0);
            make.left.equalTo(self).with.offset(0);
            make.bottom.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
        }];
       
    }
    return self;
}

-(BOOL)reloadImage:(NSString *)imageA :(NSString *)imageB{
    UIImageView *viewA = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageA]];
    [photoFrameImageView addSubview:viewA];
    [viewA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(photoFrameImageView.mas_top).with.offset(60);
        make.left.equalTo(photoFrameImageView.mas_left).with.offset(40);
        make.bottom.equalTo(photoFrameImageView.mas_bottom).with.offset(-100);
        make.right.equalTo(photoFrameImageView.mas_centerX).with.offset(-20);
    }];

    UIImageView *viewB = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageB]];
    [photoFrameImageView addSubview:viewB];
    [viewB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(photoFrameImageView.mas_top).with.offset(60);
        make.right.equalTo(photoFrameImageView.mas_right).with.offset(-40);
        make.bottom.equalTo(photoFrameImageView.mas_bottom).with.offset(-100);
        make.left.equalTo(photoFrameImageView.mas_centerX).with.offset(20);
    }];

    
    canleButton = [[UIButton alloc] init];
    [canleButton setTitle:@"返回" forState:UIControlStateNormal];
    [canleButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    canleButton.clipsToBounds =YES;
    [canleButton setTitleColor:[UIColor greenColor]forState:UIControlStateNormal];
    [self addSubview:canleButton];
    [canleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-5);
        make.right.equalTo(self).with.offset(-30);
    }];
    
    

    return YES;
}


- (void)buttonClicked
{
    if (_delegate && [_delegate respondsToSelector:@selector(canleButtonClicked)])
    {
        [_delegate canleButtonClicked];
        
    }
}

@end
