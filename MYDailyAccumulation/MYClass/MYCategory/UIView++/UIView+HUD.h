//
//  UIView+HUD.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/3.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HUDStyle)
{
    HUDStyleNormal = 0,
    HUDStyleSuccess = 1,
    HUDStyleError = 2,
    HUDStyleWarning = 3,
    HUDStyleLoading = 4
};

@interface UIView (HUD)

#pragma mark -
#pragma mark toast
- (void)showMsg:(NSString *)msg;
#pragma mark toast(自定义风格)
- (void)showMsg:(NSString *)msg style:(HUDStyle)style;
#pragma mark toast(自定义时间+风格)
- (void)showMsg:(NSString *)msg time:(CGFloat)time style:(HUDStyle)style;
#pragma mark toast(自定义block+风格)
- (void)showMsg:(NSString *)msg completion:(void(^)())completion style:(HUDStyle)style;
#pragma mark toast(自定义block+时间+风格)
- (void)showMsg:(NSString *)msg time:(CGFloat)time completion:(void(^)())completion style:(HUDStyle)style;


#pragma mark -
#pragma mark 展示loading
- (void)showLoading;
#pragma mark 展示loading+文字
- (void)showLoadingMsg:(NSString *)msg;
#pragma mark - 移除HUD
- (void)dissmissHUD;

@end
