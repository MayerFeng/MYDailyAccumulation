//
//  NSAttributedString+Extension.m
//  allrichstore
//
//  Created by Mayer on 16/11/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (Extension)

#pragma mark - 初始化(自定义文字，颜色)
+ (NSAttributedString *)attributedStringWithString:(NSString *)string color:(UIColor *)color
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = color;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    return attributedStr;
}

#pragma mark - 初始化(自定义文字，颜色，字体)
+ (NSAttributedString *)attributedStringWithString:(NSString *)string color:(UIColor *)color font:(UIFont *)font
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = color;
    attrs[NSFontAttributeName] = font;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    return attributedStr;
}

@end
