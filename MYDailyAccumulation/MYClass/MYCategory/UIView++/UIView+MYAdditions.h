//
//  UIView+MYAdditions.h
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MYAdditions)
@property CGFloat top;
@property CGFloat bottom;
@property CGFloat left;
@property CGFloat right;

@property CGFloat centerX;
@property CGFloat centerY;

@property CGFloat height;
@property CGFloat width;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

@end
