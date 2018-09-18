//
//  UIColor+MYrgb.h
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MYrgb)
#pragma mark - 16进制的颜色值
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue;
#pragma mark - 16进制的颜色值（可设置透明度）
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;

#pragma mark - 16进制的颜色字符串
+ (UIColor *)colorWithHexString:(NSString *)hexString;
#pragma mark - 16进制的颜色字符串（可设置透明度）
+ (UIColor *)colorWithHexString:(NSString *)hexString   alpha:(CGFloat)alpha;

#pragma mark - 随机色
+ (UIColor *)randomColor;
@end
