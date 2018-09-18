//
//  QBSwitchView.h
//  LiveTest
//
//  Created by Mayer on 16/9/1.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYSwitchView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                  onBackColor:(UIColor *)onBackColor
                 offBackColor:(UIColor *)offBackColor
                 onFrontColor:(UIColor *)onFrontColor
                offFrontColor:(UIColor *)offFrontColor
                    lineWidth:(CGFloat )lineWidth;

- (void)switchOn;
- (void)switchOff;

@property (nonatomic, strong) UIView *ballView;

@end
