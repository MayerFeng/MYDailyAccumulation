//
//  NSDictionary+Merge.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "NSDictionary+Merge.h"

@implementation NSDictionary (Merge)

#pragma mark - 两个字典合并
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2 {
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary * resultTemp = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [resultTemp addEntriesFromDictionary:dict2];
    [resultTemp enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if ([dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict1 objectForKey: key] dictionaryByMergingWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
        else if([dict2 objectForKey:key])
        {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict2 objectForKey: key] dictionaryByMergingWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
    }];
    return (NSDictionary *)[result mutableCopy];
}

#pragma mark - 并入一个字典
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict {
    return [[self class] dictionaryByMerging:self with: dict];
}

@end
