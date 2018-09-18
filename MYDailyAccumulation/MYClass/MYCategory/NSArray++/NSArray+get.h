//
//  NSArray+get.h
//  NeiQuanProject
//
//  Created by Mayer on 16/2/6.
//  Copyright © 2016年 河南维创盈通科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (get)

#pragma mark - 将model数组转换成其属性的数组
- (NSArray *)valueArrayWithKey:(NSString *)key;

@end
