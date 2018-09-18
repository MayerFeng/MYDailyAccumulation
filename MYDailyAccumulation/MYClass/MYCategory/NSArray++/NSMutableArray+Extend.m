//
//  NSMutableArray+Extend.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/5.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "NSMutableArray+Extend.h"

@implementation NSMutableArray (Extend)

//插入一个字符串在最前面（如果已存在相同字符串，把原有字符串调整在最前面）
- (void)insetFrontEachString:(NSString *)string
{
    for (id obj in self)
    {
        if ([obj isKindOfClass:[NSString class]])
        {
            if ([obj isEqualToString:string])
            {
                [self removeObject:obj];
                break;
            }
        }
    }
    [self insertObject:string atIndex:0];
}

@end
