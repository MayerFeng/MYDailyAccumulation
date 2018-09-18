//
//  NSDictionary+Merge.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Merge)

#pragma mark - 两个字典合并
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;
#pragma mark - 并入一个字典
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict;

@end
