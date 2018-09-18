//
//  NSArray+Judge.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/5.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Judge)

#pragma mark - 是否包含某个字符串？
- (BOOL)isHaveString:(NSString *)string;
#pragma mark - 是否包含某个数字？
- (BOOL)isHaveNumber:(NSNumber *)number;

@end
