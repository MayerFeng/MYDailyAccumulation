//
//  UIViewController+ChildVC.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/18.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ChildVC)

- (void)addChild:(UIViewController *)vc;

- (void)addChild:(UIViewController *)vc animated:(void (^)(void))animated;

- (void)addChild:(UIViewController *)vc inRect:(CGRect)rect;

- (void)addChild:(UIViewController *)vc inRect:(CGRect)rect animation:(void (^)(void))animated;

- (void)addChild:(UIViewController *)vc container:(UIView *)view;

- (void)addChild:(UIViewController *)vc container:(UIView *)view inRect:(CGRect)rect;

- (void)addChild:(UIViewController *)child container:(UIView *)view inRect:(CGRect)rect animation:(void (^)(void))animated;

- (void)removeChild:(UIViewController *)vc;

- (void)removeChild:(UIViewController *)vc animation:(void (^)(void))outAnimation;

- (void)removeChild:(UIViewController *)child inContainer:(UIView *)view;

- (void)removeChild:(UIViewController *)child inContainer:(UIView *)view animation:(void (^)(void))outAnimation;

// 默认是在self.view中操作
- (void)replace:(UIViewController *)oldVC withNew:(UIViewController *)newVC animations:(void (^)(void))animations;

- (void)replace:(UIViewController *)old withNew:(UIViewController *)newvc container:(UIView *)container animations:(void (^)(void))animations;

@end
