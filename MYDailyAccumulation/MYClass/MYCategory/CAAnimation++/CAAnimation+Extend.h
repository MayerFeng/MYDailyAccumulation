//
//  CAAnimation+Extend.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/16.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSUInteger, AnimationType) {
    
    AnimationTypeRotate
};

@interface CAAnimation (Extend)


/**
 简单动画的初始化
 @param type 动画类型
 @param duration 动画周期
 @param repeatCount 动画重复次数
 */
+ (CAAnimation *)animationType:(AnimationType)type duration:(CFTimeInterval)duration repeatCount:(float)repeatCount;

@end
