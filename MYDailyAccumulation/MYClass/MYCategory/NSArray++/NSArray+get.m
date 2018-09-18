//
//  NSArray+get.m
//  NeiQuanProject
//
//  Created by Mayer on 16/2/6.
//  Copyright © 2016年 河南维创盈通科技有限公司. All rights reserved.
//

#import "NSArray+get.h"

@implementation NSArray (get)

#pragma mark - 将model数组转换成其属性的数组
- (NSArray *)valueArrayWithKey:(NSString *)key
{
    NSMutableArray *muArray = [NSMutableArray array];
    for (int i = 0; i < self.count; i++)
    {
        NSObject *obj = self[i];
        id value = [obj valueForKeyPath:key];
        [muArray addObject:value];
    }
    return muArray;
}

@end
