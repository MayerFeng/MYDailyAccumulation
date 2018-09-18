//
//  NSObject+Common.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "NSObject+Common.h"

@implementation NSObject (Common)

#pragma mark - 类名字符串
- (NSString *)className
{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}

#pragma mark - 类名字符串（类方法）
+ (NSString *)className
{
    return NSStringFromClass(self);
}

@end
