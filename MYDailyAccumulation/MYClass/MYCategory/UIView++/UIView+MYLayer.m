//
//  UIView+MYLayer.m
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import "UIView+MYLayer.h"

@implementation UIView (MYLayer)
- (void)roundSide:(CornerSide)side
             size:(CGSize)size
      borderColor:(UIColor *)color
      borderWidth:(CGFloat)width
{
    UIBezierPath *maskPath;
    NSUInteger rectCorner = UIRectCornerAllCorners;
    switch (side)
    {
        case CornerSideTop:
        {
            rectCorner = UIRectCornerTopLeft|UIRectCornerTopRight;
        }
            break;
        case CornerSideLeft:
        {
            rectCorner = UIRectCornerTopLeft|UIRectCornerBottomLeft;
        }
            break;
        case CornerSideBottom:
        {
            rectCorner = UIRectCornerBottomLeft|UIRectCornerBottomRight;
        }
            break;
        case CornerSideRight:
        {
            rectCorner = UIRectCornerTopRight|UIRectCornerBottomRight;
        }
            break;
        case CornerSideTopLeft:
        {
            rectCorner = UIRectCornerTopLeft;
        }
            break;
        case CornerSideTopRight:
        {
            rectCorner = UIRectCornerTopRight;
        }
            break;
        case CornerSideBottomLeft:
        {
            rectCorner = UIRectCornerBottomLeft;
        }
            break;
        case CornerSideBottomRight:
        {
            rectCorner = UIRectCornerBottomRight;
        }
            break;
        default:
            break;
    }
    
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(rectCorner)
                                           cornerRadii:size];
    
    //创建shapeLayer
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    if (width <= 0 || color == nil)
    {
        return;
    }
    //添加border
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.path = maskLayer.path;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = color.CGColor;
    borderLayer.lineWidth = width * 2;
    borderLayer.frame = self.bounds;
    [self.layer addSublayer:borderLayer];
    [self.layer setMasksToBounds:YES];
}
@end
