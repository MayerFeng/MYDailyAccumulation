//
//  UIButton+MYExtension.m
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import "UIButton+MYExtension.h"

@implementation UIButton (MYExtension)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [self setBackgroundImage:[UIImage imageWithColor:backgroundColor] forState:state];
}
@end
