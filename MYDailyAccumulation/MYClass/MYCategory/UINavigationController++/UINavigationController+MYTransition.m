//
//  UINavigationController+MYTransition.m
//  MYNewDemo
//
//  Created by Mayer on 2018/9/18.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#import "UINavigationController+MYTransition.h"

@implementation UINavigationController (MYTransition)
//push
- (void)pushVC:(UIViewController *)vc  animated:(BOOL)animated {
    
    if ([NetWork networkReachabilityStatus] == AFNetworkReachabilityStatusNotReachable) {
        
        [self.visibleViewController.view showMsg:@"无网络"];
        return;
        
    }
    vc.hidesBottomBarWhenPushed = YES;
    [self pushViewController:vc animated:animated];
}


//pop
//- (UIViewController *)popVCAnimated:(BOOL)animated
//{
//    return [self popViewControllerAnimated:animated];
//}

@end
