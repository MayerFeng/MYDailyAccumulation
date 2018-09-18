//
//  NSString+Size.m
//  NeiQuanProject
//
//  Created by Mayer on 16/12/24.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

#pragma mark - 获取字符串宽高
//计算文字绘制所需大小
- (CGSize)getSizeWithWidth:(CGFloat)width font:(UIFont *)font
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size;
}

//计算文字绘制所需宽度
- (CGFloat)getWidthWithFont:(UIFont *)font
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.width;
}

//计算文字绘制所需高度
- (CGFloat)getHeightWithWidth:(CGFloat)width font:(UIFont *)font
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
}


#pragma mark - 获取属性字符串宽高
//获取字符串的Size
- (CGSize)getSizeByAttributes:(NSDictionary *)attributes
{
    CGSize size = [self sizeWithAttributes:attributes];
    return size;
}

//获取字符串的宽度
- (CGFloat)getWidthByAttributes:(NSDictionary *)attributes
{
    CGSize size =  [self sizeWithAttributes:attributes];
    return size.width;
}

//获取字符串的高度
- (CGFloat)getHeightByAttributes:(NSDictionary *)attributes
{
    CGSize size = [self sizeWithAttributes:attributes];
    return size.height;
}

@end
