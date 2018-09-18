//
//  NSArray+Sort.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/5.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "NSArray+Sort.h"

@implementation NSArray (Sort)

#pragma mark - 排序（正序）
- (NSMutableArray *)sortASWithKey:(NSString *)key {
    
    //如果是可变数组（自身排序）
    NSMutableArray *sortArray;
    if ([self isKindOfClass:[NSMutableArray class]]) {
        sortArray = (NSMutableArray *)self;
    } else {
        sortArray = [NSMutableArray arrayWithArray:self];
    }
    
    //如果传过来的key为空 直接对数组元素(字符串)排序
    if (key.length == 0) {
        
        NSArray *sortResultArray = [sortArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2]; //升序
        }];
        sortArray = [NSMutableArray arrayWithArray:sortResultArray];
        return sortArray;
    }
    
    //正序冒泡算法
    NSInteger count = sortArray.count;
    for (int i = 0; i < count; i++) {
        BOOL isHaveExchange = NO;
        for (int j = 0; j < count - 1 - i; j++) {
            id obj = sortArray[j];
            id value = [obj valueForKeyPath:key];
            float num = [value floatValue];
            
            id nextObj = sortArray[j+1];
            id nextValue = [nextObj valueForKeyPath:key];
            float nextNum = [nextValue floatValue];
            if (num > nextNum) {
                [sortArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                isHaveExchange = YES;
            }
        }
        if (!isHaveExchange) {
            break;
        }
    }
    return sortArray;
}

#pragma mark - 排序（倒序）
- (NSMutableArray *)sortDesWithKey:(NSString *)key {
    
    //如果是可变数组（自身排序）
    NSMutableArray *sortArray;
    if ([self isKindOfClass:[NSMutableArray class]]) {
        sortArray = (NSMutableArray *)self;
    } else {
        sortArray = [NSMutableArray arrayWithArray:self];
    }
    
    //如果传过来的key为空 直接对数组元素(字符串)排序
    if (key.length == 0) {
        
        NSArray *sortResultArray = [sortArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj2 compare:obj1]; //降序
        }];
        sortArray = [NSMutableArray arrayWithArray:sortResultArray];
        return sortArray;
    }
    
    //倒序冒泡算法
    NSInteger count = sortArray.count;
    for (int i = 0; i < count; i++) {
        BOOL isHaveExchange = NO;
        for (int j = 0; j < count - 1 - i; j++) {
            id obj = sortArray[j];
            id value = [obj valueForKeyPath:key];
            float num = [value floatValue];
            
            id nextObj = sortArray[j+1];
            id nextValue = [nextObj valueForKeyPath:key];
            float nextNum = [nextValue floatValue];
            if (num < nextNum) {
                [sortArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                isHaveExchange = YES;
            }
        }
        if (!isHaveExchange) {
            break;
        }
    }
    return sortArray;
}

@end
