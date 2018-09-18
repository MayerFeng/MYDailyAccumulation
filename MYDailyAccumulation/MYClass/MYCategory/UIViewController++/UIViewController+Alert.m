//
//  UIViewController+Alert.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)

#pragma mark - showAlertView
- (void)qb_showAlertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSInteger btnIndex))block {
    
    [UIAlertController qb_showAlertWithTitle:title message:message cancelTitle:cancelTitle otherTitles:otherTitles handler:^(UIAlertController *alertController, NSInteger buttonIndex) {
        block(buttonIndex);
    } vc:self];
}

#pragma mark - showSheetView
- (void)qb_showSheetWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSInteger btnIndex))block {
    
    [UIAlertController qb_showSheetWithTitle:title message:message cancelTitle:cancelTitle otherTitles:otherTitles handler:^(UIAlertController *alertController, NSInteger buttonIndex) {
        block(buttonIndex);
    } vc:self];
}

@end
