//
//  UIViewController+Transition.m
//  allrichstore
//
//  Created by Mayer on 16/11/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIViewController+Transition.h"

@implementation UIViewController (Transition)

#pragma mark - present / dismiss
- (void)presentVC:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion {
    
    if ([NetWork networkReachabilityStatus] == AFNetworkReachabilityStatusNotReachable) {
        
        [self.view showMsg:@"无网络"];
        return;
        
    }
    [self presentViewController:vc animated:animated completion:completion];
}

- (void)dismissVCAnimated:(BOOL)animated completion:(void (^)(void))completion {
    
    [self dismissViewControllerAnimated:animated completion:completion];
}

@end
