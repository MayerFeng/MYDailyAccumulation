//
//  UIViewController+Alert.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

#pragma mark - showAlertView
- (void)qb_showAlertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSInteger btnIndex))block;

#pragma mark - showSheetView
- (void)qb_showSheetWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSInteger btnIndex))block;

@end
