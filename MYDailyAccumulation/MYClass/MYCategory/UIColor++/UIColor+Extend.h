//
//  UIColor+Extend.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/9.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extend)
/*
    说明：为了便于观察，red,green,blue是真实值的255倍
 */

#pragma mark - getter(R,G,B,A)
- (CGFloat)red;
- (CGFloat)green;
- (CGFloat)blue;
- (CGFloat)alpha;

#pragma mark - 改变(R,G,B,A)的值返回一个新对象
- (UIColor *)setTheRed:(CGFloat)red;
- (UIColor *)setTheGreen:(CGFloat)green;
- (UIColor *)setTheBlue:(CGFloat)blue;
- (UIColor *)setTheAlpha:(CGFloat)alpha;

#pragma mark - 获取颜色字典
- (NSDictionary *)getRGBADic;

@end
