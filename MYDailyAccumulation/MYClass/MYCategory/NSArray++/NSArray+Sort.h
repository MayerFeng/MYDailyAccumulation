//
//  NSArray+Sort.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/5.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Sort)

#pragma mark - 排序（正序）
- (NSMutableArray *)sortASWithKey:(NSString *)key;
#pragma mark - 排序（倒序）
- (NSMutableArray *)sortDesWithKey:(NSString *)key;

@end
