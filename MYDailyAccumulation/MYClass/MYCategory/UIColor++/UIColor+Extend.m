//
//  UIColor+Extend.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/9.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIColor+Extend.h"

@implementation UIColor (Extend)

#pragma mark - getter(R,G,B,A)
- (CGFloat)red
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
    }
    return r * 255;
}

- (CGFloat)green
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        g = components[1];
    }
    return g * 255;
}

- (CGFloat)blue
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        b = components[2];
    }
    return b * 255;
}

- (CGFloat)alpha
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        a = components[3];
    }
    return a;
}

#pragma mark - 改变(R,G,B,A)的值返回一个新对象
- (UIColor *)setTheRed:(CGFloat)red
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return [UIColor colorWithRed:red / 255.0 green:g blue:b alpha:a];
}

- (UIColor *)setTheGreen:(CGFloat)green
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return [UIColor colorWithRed:r green:green / 255.0 blue:b alpha:a];
}

- (UIColor *)setTheBlue:(CGFloat)blue
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return [UIColor colorWithRed:r green:g blue:blue / 255.0 alpha:a];
}


- (UIColor *)setTheAlpha:(CGFloat)alpha
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

#pragma mark - 获取颜色字典
- (NSDictionary *)getRGBADic
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return @{@"R":@(r), @"G":@(g), @"B":@(b), @"A":@(a)};
}

@end
