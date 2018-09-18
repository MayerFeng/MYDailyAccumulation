//
//  NSDictionary+URL.h
//  IOS-Categories
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (URL)

#pragma mark - 将url参数转换成NSDictionary
+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query;
#pragma mark - 将NSDictionary转换成url 参数字符串
- (NSString *)URLQueryString;

@end
