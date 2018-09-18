//
//  UIScrollView+MYExtension.m
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import "UIScrollView+MYExtension.h"
#import <objc/runtime.h>

@implementation UIScrollView (MYExtension)
#pragma mark - setter getter
- (void)setInsets:(UIEdgeInsets)insets
{
    NSValue *value = [NSValue value:&insets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &scrollViewInset, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.contentInset = insets;
    self.scrollIndicatorInsets = insets;
    self.contentOffset = CGPointMake(-insets.left, -insets.top);
}

- (UIEdgeInsets)insets
{
    NSValue *value = objc_getAssociatedObject(self, &scrollViewInset);
    if(value)
    {
        UIEdgeInsets aInsets;
        [value getValue:&aInsets];
        return aInsets;
    }
    else
    {
        return UIEdgeInsetsZero;
    }
}

//设置刷新头
- (void)setRefreshHeader:(id)header
{
    //[self setMj_header:header];
}

//设置刷新尾
- (void)setRefreshFooter:(id)footer
{
    //[self setMj_footer:footer];
}
@end
