//
//  NSArray+Judge.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/5.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "NSArray+Judge.h"   //判断

@implementation NSArray (Judge)

#pragma mark - 是否包含某个字符串？
- (BOOL)isHaveString:(NSString *)string
{
    for (id obj in self)
    {
        if ([obj isKindOfClass:[NSString class]])
        {
            if ([obj isEqualToString:string])
            {
                return YES;
            }
        }
    }
    return NO;
}

#pragma mark - 是否包含某个数字？
- (BOOL)isHaveNumber:(NSNumber *)number
{
    for (id obj in self)
    {
        if ([obj isKindOfClass:[NSNumber class]])
        {
            NSNumber *aNumber = obj;
            if ([aNumber floatValue] == [number floatValue])
            {
                return YES;
            }
        }
    }
    return NO;
}

@end
