//
//  QBTextFiled.h
//  GameLive
//
//  Created by Mayer on 17/2/8.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface QBTextFiled : UITextField

@property (nonatomic,assign) CGFloat leftViewOffsetX;
@property (nonatomic,assign) CGFloat rightViewOffsetX;
@property (nonatomic,assign) CGFloat textLeftOffsetX;
@property (nonatomic,assign) CGFloat textRightOffsetX;
@property (nonatomic,assign) CGFloat clearBtnOffsetX;

- (instancetype)initWithConfig:(OneParamBlock)config;

@end
