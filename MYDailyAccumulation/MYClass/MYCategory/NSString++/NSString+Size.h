//
//  NSString+Size.h
//  NeiQuanProject
//
//  Created by Mayer on 16/12/24.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

#pragma mark - 获取字符串宽高
//计算文字绘制所需大小
- (CGSize)getSizeWithWidth:(CGFloat)width font:(UIFont *)font;
//计算文字绘制所需宽度
- (CGFloat)getWidthWithFont:(UIFont *)font;
//计算文字绘制所需高度
- (CGFloat)getHeightWithWidth:(CGFloat)width font:(UIFont *)font;

#pragma mark - 获取属性字符串宽高
//获取字符串的Size
- (CGSize)getSizeByAttributes:(NSDictionary *)attributes;
//获取字符串的宽度
- (CGFloat)getWidthByAttributes:(NSDictionary *)attributes;
//获取字符串的高度
- (CGFloat)getHeightByAttributes:(NSDictionary *)attributes;

@end
