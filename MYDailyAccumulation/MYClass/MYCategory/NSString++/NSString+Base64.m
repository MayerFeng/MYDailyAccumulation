//
//  NSString+Base64.m
//  LiveTest
//
//  Created by Mayer on 16/8/1.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)

#pragma mark - Base64编码
- (NSString *)base64Encode
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

#pragma mark - Base64编码还原
- (NSString *)base64Decode
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

#pragma mark - Base64编码(类方法)
+ (NSString *)base64Encode:(NSString *)str
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

#pragma mark - Base64编码还原(类方法)
+ (NSString *)base64Decode:(NSString *)str
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:str options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

@end
