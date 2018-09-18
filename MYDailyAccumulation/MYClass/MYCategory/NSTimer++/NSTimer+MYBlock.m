//
//  NSTimer+MYBlock.m
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import "NSTimer+MYBlock.h"

@implementation NSTimer (MYBlock)
/**
 创建一个立马执行的Block定时器
 @param timeInterval 时间间隔
 @param repeats      是否重复循环
 @param block        间隔触发块
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block
{
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(looperActionTimer:) userInfo:[block copy] repeats:repeats];
}

#pragma mark - 创建一个Block定时器
/**
 创建一个Block定时器
 @param timeInterval 时间间隔
 @param repeats      是否重复循环
 @param block        间隔触发块
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block
{
    return [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(looperActionTimer:) userInfo:[block copy] repeats:repeats];
}

#pragma mark - 定时器的触发事件
+ (void)looperActionTimer:(NSTimer *)timer
{
    void (^block)(NSTimer *) = [timer userInfo];
    if (block) {
        block(timer);
    }
}
@end
