//
//  CAAnimation+Extend.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/16.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "CAAnimation+Extend.h"  //动画扩展

@implementation CAAnimation (Extend)

/**
 简单动画的初始化
 @param type 动画类型
 @param duration 动画周期
 @param repeatCount 动画重复次数
 */
+ (CAAnimation *)animationType:(AnimationType)type duration:(CFTimeInterval)duration repeatCount:(float)repeatCount {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0, 0, 1.0) ];
    animation.duration = duration;
    animation.cumulative = YES;
    animation.repeatCount = repeatCount;
    return animation;
}

@end
