//
//  RootView.h
//  天天爱找茬
//
//  Created by 李世爽 on 16/4/30.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "GameCenter.h"
#import "playMusic.h"
@protocol RootViewDelegate <NSObject>

- (void)rankingButtonClicked;
- (void)contactUsButtonClicked;
- (void)updateButtonClicked;
-(void)addButtonClicked;
-(void)reduceButtonClicked;
-(void)starButtonClicked:(NSInteger)tag;

@end

@interface RootView : UIView
{
    id<RootViewDelegate> _delegate;
}
@property (strong,nonatomic)id<RootViewDelegate> delegate;

@end
