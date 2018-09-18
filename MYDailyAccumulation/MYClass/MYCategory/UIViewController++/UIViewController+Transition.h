//
//  UIViewController+Transition.h
//  allrichstore
//
//  Created by Mayer on 16/11/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Transition)

#pragma mark - present / dismiss
- (void)presentVC:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion;

- (void)dismissVCAnimated:(BOOL)animated completion:(void (^)(void))completion;

@end
