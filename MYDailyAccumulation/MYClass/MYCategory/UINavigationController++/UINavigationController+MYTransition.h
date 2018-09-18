//
//  UINavigationController+MYTransition.h
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (MYTransition)
//push
- (void)pushVC:(UIViewController *)vc  animated:(BOOL)animated;
////pop
//- (UIViewController *)popVCAnimated:(BOOL)animated;
@end
