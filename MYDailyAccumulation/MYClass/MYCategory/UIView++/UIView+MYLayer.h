//
//  UIView+MYLayer.h
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CornerSide) {
    CornerSideTop = 0,
    CornerSideLeft = 1,
    CornerSideBottom = 2,
    CornerSideRight = 3,
    CornerSideTopLeft = 4,
    CornerSideTopRight = 5,
    CornerSideBottomLeft = 6,
    CornerSideBottomRight = 7,
    CornerSideAll = 8
};
@interface UIView (MYLayer)
- (void)roundSide:(CornerSide)side
             size:(CGSize)size
      borderColor:(UIColor *)color
      borderWidth:(CGFloat)width;

@end
