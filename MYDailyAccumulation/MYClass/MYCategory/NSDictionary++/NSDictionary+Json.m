//
//  NSDictionary+Json.m
//  NeiQuanProject
//
//  Created by Mayer on 16/8/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "NSDictionary+Json.h"

@implementation NSDictionary (Json)

#pragma mark - 转换成json字符串
- (NSString *)jsonString
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
