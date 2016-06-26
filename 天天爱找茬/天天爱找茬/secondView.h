//
//  secondView.h
//  天天爱找茬
//
//  Created by 李世爽 on 16/4/30.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@protocol secondViewDelegate <NSObject>


- (void)canleButtonClicked;

@end

@interface secondView : UIView
{
    id<secondViewDelegate> _delegate;
}
@property (strong,nonatomic)id<secondViewDelegate> delegate;
-(BOOL)reloadImage:(NSString *)imageA :(NSString *)imageB;


@end
