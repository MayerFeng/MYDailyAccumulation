//
//  NSString+Base64.h
//  LiveTest
//
//  Created by Mayer on 16/8/1.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)

#pragma mark - Base64编码
- (NSString *)base64Encode;
#pragma mark - Base64编码还原
- (NSString *)base64Decode;

#pragma mark - Base64编码(类方法)
+ (NSString *)base64Encode:(NSString *)str;
#pragma mark - Base64编码还原(类方法)
+ (NSString *)base64Decode:(NSString *)str;

@end
