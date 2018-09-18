//
//  UIFont+MYFont.m
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import "UIFont+MYFont.h"
#import <CoreText/CoreText.h>

@implementation UIFont (MYFont)
///系统字体
+ (UIFont *)systemFontOfSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:fontSize];
}

//自定义字体（通过沙盒路径取出字体）
+ (UIFont *)customFontWithName:(NSString *)name size:(CGFloat)size
{
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingPathComponent:kCustomFontPath];
    NSString *path = [resourcePath stringByAppendingPathComponent:name];
    
    NSURL *fontUrl = [NSURL fileURLWithPath:path];
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)fontUrl);
    CGFontRef fontRef = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(fontRef, NULL);
    NSString *fontName = CFBridgingRelease(CGFontCopyPostScriptName(fontRef));
    UIFont *font = [UIFont fontWithName:fontName size:size];
    CGFontRelease(fontRef);
    return font;
}
@end
