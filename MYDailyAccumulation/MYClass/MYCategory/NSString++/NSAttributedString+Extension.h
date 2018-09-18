//
//  NSAttributedString+Extension.h
//  allrichstore
//
//  Created by Mayer on 16/11/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (Extension)

#pragma mark - 初始化(自定义文字，颜色)
+ (NSAttributedString *)attributedStringWithString:(NSString *)string color:(UIColor *)color;

#pragma mark - 初始化(自定义文字，颜色，字体)
+ (NSAttributedString *)attributedStringWithString:(NSString *)string color:(UIColor *)color font:(UIFont *)font;

@end
