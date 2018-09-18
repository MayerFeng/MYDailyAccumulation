//
//  NSDictionary+Json.h
//  NeiQuanProject
//
//  Created by Mayer on 16/8/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Json)

#pragma mark - 转换成json字符串
- (NSString *)jsonString;

@end
