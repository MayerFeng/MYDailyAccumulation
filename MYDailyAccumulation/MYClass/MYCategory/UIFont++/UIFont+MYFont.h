//
//  UIFont+MYFont.h
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (MYFont)
//系统字体
+ (UIFont *)systemFontOfSize:(CGFloat)fontSize;

//自定义字体（通过沙盒路径取出字体）
+ (UIFont *)customFontWithName:(NSString *)name size:(CGFloat)size;

@end
