//
//  UIView+HUD.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/3.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIView+HUD.h"

/*
 使用：MBHUD       :0
 使用：SVHUD       :1
 使用：CUSTOMHUD   :2
 */
#define kToastStyle  0

//默认HUD的展示时间
#define kTime        1.2

//MBHUD的文字颜色
#define kMB_textColor   [UIColor colorWithWhite:0.96 alpha:1.0]
//MBHUD的背景框的背景颜色
#define kMB_oblongColor [UIColor colorWithWhite:0.0 alpha:0.5]

@implementation UIView (HUD)

#pragma mark - 
#pragma mark toast
- (void)showMsg:(NSString *)msg
{
    [self showMsg:msg time:kTime completion:nil style:HUDStyleNormal];
}

#pragma mark toast(自定义风格)
- (void)showMsg:(NSString *)msg style:(HUDStyle)style
{
    [self showMsg:msg time:kTime completion:nil style:style];
}

#pragma mark toast(自定义时间+风格)
- (void)showMsg:(NSString *)msg time:(CGFloat)time style:(HUDStyle)style
{
    [self showMsg:msg time:time completion:nil style:style];
}

#pragma mark toast(自定义block+风格)
- (void)showMsg:(NSString *)msg completion:(void(^)())completion style:(HUDStyle)style
{
    [self showMsg:msg time:kTime completion:completion style:style];
}

#pragma mark toast(自定义block+时间+风格)
- (void)showMsg:(NSString *)msg time:(CGFloat)time completion:(void(^)())completion style:(HUDStyle)style
{
#if (kToastStyle == 0)
    [MBProgressHUD hideAllHUDsForView:self animated:NO];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    
    // 隐藏时候从父控件中移除
    hud.opacity = 10.;
    hud.removeFromSuperViewOnHide = YES;
    hud.detailsLabelColor = kMB_textColor;
    hud.color = kMB_oblongColor;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:16.0];
    hud.detailsLabelText = msg;
    
    switch (style)
    {
        case HUDStyleNormal:
        {
            hud.mode = MBProgressHUDModeText;
        }
            break;
        case HUDStyleSuccess:
        {
            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MBProgress_success_icon"]];
            hud.mode = MBProgressHUDModeCustomView;
        }
            break;
        case HUDStyleError:
        {
            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MBProgress_error_icon"]];
            hud.mode = MBProgressHUDModeCustomView;
        }
            break;
        case HUDStyleWarning:
        {
            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MBProgress_warning_icon"]];
            hud.mode = MBProgressHUDModeCustomView;
        }
            break;
        case HUDStyleLoading:
        {
            hud.mode = MBProgressHUDModeIndeterminate;
        }
            break;
        default:
            break;
    }
    
    hud.completionBlock = ^() {
        if (completion) {
            completion();
        }
    };
    [hud show:YES];
    [hud hide:YES afterDelay:time];
#elif (kToastStyle == 1)

    switch (style)
    {
            
        case HUDStyleNormal:
        {
            [SVProgressHUD showImage:nil status:msg];
        }
            break;
        case HUDStyleSuccess:
        {
            [SVProgressHUD showSuccessWithStatus:msg];
        }
            break;
        case HUDStyleError:
        {
            [SVProgressHUD showErrorWithStatus:msg];
        }
            break;
        case HUDStyleWarning:
        {
            [SVProgressHUD showInfoWithStatus:msg];
        }
            break;
        default:
            break;
    }
    
    [SVProgressHUD dismissWithDelay:time completion:^{
        if (completion) {
            completion();
        }
    }];
#else
    [QBProgressHUD hideAllHUDsForView:self animated:NO];
    QBProgressHUD *hud = [[QBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    hud.title = msg;
    hud.titleColor = kBlackColor;
    hud.style = QBProgressHUDStyleCustomView;
    hud.animationStyle = QBProgressHUDAnimationZoomOut;
    hud.completionBlock = ^() {
        if (completion) {
            completion();
        }
    };
    
    switch (style)
    {
        case HUDStyleNormal:
        {
            
        }
            break;
        case HUDStyleSuccess:
        {
            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MBProgress_success_icon"]];
        }
            break;
        case HUDStyleError:
        {
            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MBProgress_error_icon"]];
        }
            break;
        case HUDStyleWarning:
        {
            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MBProgress_warning_icon"]];
        }
            break;
        default:
            break;
    }
    
    [hud show:YES];
    [hud hide:YES after:time];
#endif
}

#pragma mark -
#pragma mark 展示loading
- (void)showLoading
{
    [self showLoadingMsg:nil];
}

#pragma mark 展示loading+文字
- (void)showLoadingMsg:(NSString *)msg
{
#if (kToastStyle == 0)
    [MBProgressHUD hideAllHUDsForView:self animated:NO];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.detailsLabelColor = kMB_textColor;
    hud.color = kMB_oblongColor;
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
    hud.detailsLabelText = msg;
    [hud show:YES];
    
#elif (kToastStyle == 1)
    [SVProgressHUD showWithStatus:msg];
#else
    [QBProgressHUD hideAllHUDsForView:self animated:NO];
    QBProgressHUD *hud = [[QBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    //hud.animationStyle = QBProgressHUDAnimationZoomOut;
    //hud.layoutStyle = QBProgressHUDLayoutLeftRight;
    hud.title = msg;
    hud.titleColor = [UIColor grayColor];
    hud.titleFont = [UIFont systemFontOfSize:12];
    hud.smallWindowBgColor = [UIColor clearColor];
    [hud show:YES];
#endif
}

#pragma mark - 移除HUD
- (void)dissmissHUD
{
#if (kToastStyle == 0)
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
#elif (kToastStyle == 1)
    [SVProgressHUD dismiss];
#else
    [QBProgressHUD hideAllHUDsForView:self animated:YES];
#endif
}

@end
