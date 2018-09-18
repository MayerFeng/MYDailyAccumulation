//
//  UIScrollView+MYExtension.h
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (MYExtension)
@property (nonatomic, assign) UIEdgeInsets insets;

//设置刷新头
- (void)setRefreshHeader:(id)header;
//设置刷新尾
- (void)setRefreshFooter:(id)footer;
@end
