//
//  UIView+Shadow.h
//  allrichstore
//
//  Created by Mayer on 16/10/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shadow)

- (void)setShadow;

- (void)setShadowWithColor:(UIColor *)shadowColor;

- (void)setShadowWithOffset:(CGSize)size;

- (void)setShadowWithColor:(UIColor *)shadowColor offset:(CGSize)size;

@end
