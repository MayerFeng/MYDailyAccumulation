//
//  QBProgressHUD.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/10.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

//HUD的类型
typedef NS_ENUM(NSInteger, QBProgressHUDStyle) {
    QBProgressHUDStyleLoading,      //带loading
    QBProgressHUDStyleText,         //只有文字
    QBProgressHUDStylePercentBar,   //进度条
    QBProgressHUDStyleCustomView    //自定义视图
};

//HUD"小窗的风格"
typedef  NS_ENUM(NSInteger, QBProgressHUDBlurEffectStyle) {
    QBProgressHUDBlurEffectStyleClear,  //透明
    QBProgressHUDBlurEffectStyleLight,  //light毛玻璃
    QBProgressHUDBlurEffectStyleDark    //dark毛玻璃
};

//HUD动画的类型
typedef NS_ENUM(NSInteger, QBProgressHUDAnimation) {
    QBProgressHUDAnimationFade,     //淡入淡出
    QBProgressHUDAnimationZoomOut,  //淡入淡出 + 放大效果
    QBProgressHUDAnimationZoomIn    //淡入淡出 + 缩小效果
};

//loading与label布局的类型
typedef NS_ENUM(NSInteger, QBProgressHUDLayout) {
    QBProgressHUDLayoutUpDown,      //上下布局（默认）
    QBProgressHUDLayoutLeftRight,   //左右布局（默认）
};

//HUD加载完毕时的触发block
typedef void (^QBProgressHUDCompletionBlock)();

@interface QBProgressHUD : UIView

//隐藏之前所有的视图
+ (NSUInteger)hideAllHUDsForView:(UIView *)view animated:(BOOL)animated;

- (id)initWithView:(UIView *)view;

- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;
- (void)hide:(BOOL)animated after:(NSTimeInterval)delay;

//HUD的类型
@property (nonatomic, assign) QBProgressHUDStyle style;
//HUD"小窗的风格"
@property (nonatomic, assign) QBProgressHUDBlurEffectStyle effectStyle;
//HUD动画的类型
@property (nonatomic, assign) QBProgressHUDAnimation animationStyle;
//loading与label布局的类型
@property (nonatomic, assign) QBProgressHUDLayout layoutStyle;
//HUD消失的时候出发的block
@property (nonatomic, copy) QBProgressHUDCompletionBlock completionBlock;

//"小窗"的背景颜色
@property (nonatomic, strong) UIColor *smallWindowBgColor;

//文字
@property (nonatomic, copy) NSString *title;
//label字体
@property (nonatomic, strong) UIFont *titleFont;
//文字颜色
@property (nonatomic, strong) UIColor *titleColor;

//指示条的颜色
@property (nonatomic, strong) UIColor *indicatorColor;

//自定义view
@property (nonatomic, strong) UIView *customView;

//中心小窗的偏移x,y
@property (nonatomic, assign) CGFloat offX;
@property (nonatomic, assign) CGFloat offY;

@end
