//
//  UIColor+MYrgb.m
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import "UIColor+MYrgb.h"

@implementation UIColor (MYrgb)
#pragma mark - 16进制的颜色值
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue
{
    return  [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                            green:((float)((hexValue & 0xFF00) >> 8))/255.0
                             blue:((float)(hexValue & 0xFF))/255.0
                            alpha:1.0];
}

#pragma mark - 16进制的颜色值（可设置透明度）
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha
{
    return  [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                            green:((float)((hexValue & 0xFF00) >> 8))/255.0
                             blue:((float)(hexValue & 0xFF))/255.0
                            alpha:alpha];
}

#pragma mark - 16进制的颜色字符串
+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [self colorWithHexString:hexString alpha:1.0f];
}

#pragma mark - 16进制的颜色字符串（可设置透明度）
+ (UIColor *)colorWithHexString:(NSString *)hexString   alpha:(CGFloat)alpha
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //传入的颜色值字符串必须是6-8位！
    if ([cString length] < 6) {
        NSAssert(([cString length] < 6 || ([cString length] > 8)), @"传入的颜色值字符串必须是6-8位！");
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"0x"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    NSAssert([cString length] == 6, @"检查一下传入的颜色值字符串格式是否正确！");
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    //扫描RGB
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

#pragma mark - 随机色
+ (UIColor *)randomColor
{
    NSUInteger randomRedNum = arc4random() % 256;
    NSUInteger randomGreenNum = arc4random() % 256;
    NSUInteger randomBlueNum = arc4random() % 256;
    return [UIColor colorWithRed:randomRedNum / 255.0 green:randomGreenNum / 255.0 blue:randomBlueNum / 255.0 alpha:1.0];
}
@end
