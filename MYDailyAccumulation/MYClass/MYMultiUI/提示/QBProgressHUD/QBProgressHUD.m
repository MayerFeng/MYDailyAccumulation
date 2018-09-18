//
//  QBProgressHUD.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/10.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "QBProgressHUD.h"

//HUD小窗留白边距
#define kMarginHor  15
#define kMarginVer  12

//指示器与label之间的距离
#define kSpaceHor_IL 5
#define kSpaceVer_IL 5

//label的最大宽度
#define kMaxLabelWidth  (_bgView.width - 100)

//"小窗"的默认颜色
#define kSmallWindowBgColor   [UIColor colorWithWhite:0.0 alpha:0.4]

//"小窗"的偏移(默认值)
#define kSamllWindowOffX     0
#define kSamllWindowOffY     -10

//标题的默认颜色
#define kTitleColor   [UIColor colorWithWhite:1.0 alpha:1.0]
//标题的默认字体
#define kTitleFont  [UIFont boldSystemFontOfSize:14]

@interface QBProgressHUD () {
    BOOL useAnimation;
    BOOL isShowing;
    BOOL isFinished;
    BOOL isLayouted;
    CGAffineTransform rotationTransform;
    
    NSLayoutConstraint *smallWidowConstant_width;
    NSLayoutConstraint *smallWidowConstant_height;
}

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *smallWindowView;
@property (nonatomic, strong) UIVisualEffectView *blurEffectView;
@property (nonatomic, strong) UIVisualEffectView *vibrancyEffectView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UIView *percentBar;

@property (nonatomic, strong) UIBlurEffect *blurEffect;

@property (nonatomic, strong) NSLayoutConstraint *customConstant_offX;
@property (nonatomic, strong) NSLayoutConstraint *customConstant_offY;
@property (nonatomic, strong) NSLayoutConstraint *customConstant_width;
@property (nonatomic, strong) NSLayoutConstraint *customConstant_height;

@property (nonatomic, strong) NSLayoutConstraint *labelConstant_offX;
@property (nonatomic, strong) NSLayoutConstraint *labelConstant_offY;
@property (nonatomic, strong) NSLayoutConstraint *labelConstant_width;
@property (nonatomic, strong) NSLayoutConstraint *labelConstant_height;

@end

@implementation QBProgressHUD

//隐藏之前所有的视图
+ (NSUInteger)hideAllHUDsForView:(UIView *)view animated:(BOOL)animated
{
    NSArray *huds = [QBProgressHUD allHUDsForView:view];
    for (QBProgressHUD *hud in huds) {
        [hud hide:animated];
    }
    return [huds count];
}

//取出所有的HUD
+ (NSArray *)allHUDsForView:(UIView *)view {
    NSMutableArray *huds = [NSMutableArray array];
    NSArray *subviews = view.subviews;
    for (UIView *aView in subviews) {
        if ([aView isKindOfClass:self]) {
            [huds addObject:aView];
        }
    }
    return [NSArray arrayWithArray:huds];
}

#pragma mark - Lifecycle
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //给属性设置默认值
        self.animationStyle = QBProgressHUDAnimationFade;
        self.style = QBProgressHUDStyleLoading;
        self.offX = kSamllWindowOffX;
        self.offY = kSamllWindowOffY;
        self.smallWindowBgColor = kSmallWindowBgColor;
        self.titleColor = kTitleColor;
        self.titleFont = kTitleFont;
        rotationTransform = CGAffineTransformIdentity;
        
        //背景透明
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0.0f;
        
        [self addSubview:self.bgView];
        [self layoutBgView];
        [self setupConstraints];
//
//        [self setupLabels];
//        [self updateIndicators];
//        [self registerForKVO];
//        [self registerForNotifications];
    }
    return self;
}

- (id)initWithView:(UIView *)view
{
    NSAssert(view, @"HUD的父视图不能为nil!");
    return [self initWithFrame:view.bounds];
}

#pragma mark - layout
//创建约束
- (void)setupConstraints
{
    //给"小窗"添加约束（宽高，到确定了子控件的大小之后再更新）
    self.smallWindowView.translatesAutoresizingMaskIntoConstraints = NO;
    [_bgView addSubview:_smallWindowView];
    [_bgView addConstraint:[NSLayoutConstraint constraintWithItem:_smallWindowView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_bgView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [_bgView addConstraint:[NSLayoutConstraint constraintWithItem:_smallWindowView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_bgView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    smallWidowConstant_width = [NSLayoutConstraint constraintWithItem:_smallWindowView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:0];
    [_bgView addConstraint:smallWidowConstant_width];
    smallWidowConstant_height = [NSLayoutConstraint constraintWithItem:_smallWindowView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:0];
    [_bgView addConstraint:smallWidowConstant_height];
    
    //给底层毛玻璃添加约束
    self.blurEffectView.translatesAutoresizingMaskIntoConstraints = NO;
    [_smallWindowView addSubview:_blurEffectView];
    [_smallWindowView addConstraint:[NSLayoutConstraint constraintWithItem:_blurEffectView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [_smallWindowView addConstraint:[NSLayoutConstraint constraintWithItem:_blurEffectView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [_smallWindowView addConstraint:[NSLayoutConstraint constraintWithItem:_blurEffectView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    [_smallWindowView addConstraint:[NSLayoutConstraint constraintWithItem:_blurEffectView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    
    //给上层毛玻璃添加约束
    self.vibrancyEffectView.translatesAutoresizingMaskIntoConstraints = NO;
    [_smallWindowView addSubview:_vibrancyEffectView];
    [_smallWindowView addConstraint:[NSLayoutConstraint constraintWithItem:_vibrancyEffectView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [_smallWindowView addConstraint:[NSLayoutConstraint constraintWithItem:_vibrancyEffectView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [_smallWindowView addConstraint:[NSLayoutConstraint constraintWithItem:_vibrancyEffectView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    [_smallWindowView addConstraint:[NSLayoutConstraint constraintWithItem:_vibrancyEffectView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
}

//更新约束
- (void)updateViewConstraints
{
    //布局风格是否为垂直
    BOOL isVer = (_layoutStyle == QBProgressHUDLayoutUpDown);
    //是否有文字
    BOOL isHaveText = _title && _title.length;
    if (isHaveText) {
        self.titleLabel.font = _titleFont;
        self.titleLabel.textColor = _titleColor;
        self.titleLabel.text = _title;
    }
    
    //文字占用的大小
    CGSize textSize = isHaveText ? [self getSizeLabel:_titleLabel width:kMaxLabelWidth] : CGSizeZero;
    //自定义视图的大小
    CGSize customViewSize = _customView ? _customView.bounds.size : CGSizeZero;
    
    if (_customView) {
        _customView.translatesAutoresizingMaskIntoConstraints = NO;
        [_bgView addSubview:_customView];
        //更新约束
        self.customConstant_offX.constant = isVer ? 0 : (isHaveText ? - (textSize.width + kSpaceHor_IL) / 2.0 : 0);
        self.customConstant_offY.constant = isVer ? (isHaveText ? - (textSize.height + kSpaceVer_IL) / 2.0 : 0) : 0;
        self.customConstant_width.constant = customViewSize.width;
        self.customConstant_height.constant = customViewSize.height;
    }
    
    if (isHaveText) {
        //给label添加约束
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_smallWindowView addSubview:_titleLabel];
        //更新约束
        self.labelConstant_offX.constant = isVer ? 0 : (customViewSize.width > 0 ? (customViewSize.width + kSpaceHor_IL) / 2.0 : 0);
        self.labelConstant_offY.constant = isVer ? (customViewSize.height > 0 ? (customViewSize.height + kSpaceVer_IL) / 2.0 : 0) : 0;
        self.labelConstant_width.constant = ceil(textSize.width);
        self.labelConstant_height.constant = ceil(textSize.height);
    }
    
    BOOL isHaveHorSpace = textSize.width > 0 && customViewSize.width > 0;
    BOOL isHaveVerSpace = textSize.height > 0 && customViewSize.height > 0;
    
    //计算出需要的最大宽度
    CGFloat maxWidth = isVer ? (textSize.width > customViewSize.width ? textSize.width : customViewSize.width) : (textSize.width + customViewSize.width + (isHaveHorSpace ? kSpaceHor_IL : 0));
    CGFloat maxHeight = isVer ? customViewSize.height + textSize.height + (isHaveVerSpace ? kSpaceVer_IL : 0) : (textSize.height > customViewSize.height ? textSize.height : customViewSize.height);
    
    //更新"小窗" 的宽和高的约束
    smallWidowConstant_width.constant = maxWidth + 2 * kMarginHor;
    smallWidowConstant_height.constant = maxHeight + 2 * kMarginVer;
    [self layoutIfNeeded];
}

//更新属性
- (void)updateAttributesAnimated:(BOOL)animated
{
    self.smallWindowView.backgroundColor = _smallWindowBgColor;
    switch (_style) {
        case QBProgressHUDStyleLoading: {
            //把自定义视图设置为——> (加载指示器)
            self.customView = self.indicatorView;
        }
            break;
        case QBProgressHUDStyleText: {
            //把自定义视图置为空
            self.customView = nil;
        }
            break;
        case QBProgressHUDStylePercentBar: {
            //把自定义视图设置为———> (进度条)
            self.customView = self.percentBar;
        }
            break;
        case QBProgressHUDStyleCustomView: {
            
        }
            break;
        default:
            break;
    }
    
    if (animated == YES) {
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self updateViewConstraints];
        } completion:^(BOOL finished) {
            isLayouted = YES;
        }];
    } else {
        [self updateViewConstraints];
        isLayouted = YES;
    }
}

//给动画背景视图添加约束
- (void)layoutBgView {
    CGFloat bgViewWidth = self.bounds.size.width - fabs(_offX * 2.0);
    CGFloat bgViewHeight = self.bounds.size.height - fabs(_offY * 2.0);
    CGFloat bgViewX = _offX > 0 ? _offX * 2.0 : 0;
    CGFloat bgViewY = _offY > 0 ? _offY * 2.0 : 0;
    _bgView.frame = CGRectMake(bgViewX, bgViewY, bgViewWidth, bgViewHeight);
}

#pragma mark - lazy
#pragma mark 视图

- (UIView *)percentBar {
    if (!_percentBar) {
        self.percentBar = [UIView new];
        _percentBar.bounds = CGRectMake(0, 0, 50, 50);
        _percentBar.backgroundColor = kRedColor;
        _percentBar.layer.cornerRadius = 25;
    }
    return _percentBar;
}

- (UIView *)bgView {
    if (!_bgView) {
        self.bgView = [UIView new];
    }
    return _bgView;
}

- (UIView *)smallWindowView {
    if (!_smallWindowView) {
        self.smallWindowView = [UIView new];
        _smallWindowView.clipsToBounds = YES;
        _smallWindowView.layer.cornerRadius = 10;
    }
    return _smallWindowView;
}

- (UIVisualEffectView *)blurEffectView
{
    if (!_blurEffectView) {
        self.blurEffectView = [UIVisualEffectView new];
        _blurEffectView.effect = self.blurEffect;
    }
    return _blurEffectView;
}

- (UIVisualEffectView *)vibrancyEffectView {
    if (!_vibrancyEffectView) {
        self.vibrancyEffectView = [UIVisualEffectView new];
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _vibrancyEffectView.effect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    }
    return _vibrancyEffectView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = _titleColor;
        _titleLabel.text = _title;
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = kGreenColor;
    }
    return _titleLabel;
}

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        if (_indicatorColor) {
            _indicatorView.color = _indicatorColor;
        }
        [_indicatorView startAnimating];
    }
    return _indicatorView;
}

- (UIBlurEffect *)blurEffect
{
    if (!_blurEffect) {
        if (_effectStyle == QBProgressHUDBlurEffectStyleLight) {
            self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        } else if (_effectStyle == QBProgressHUDBlurEffectStyleDark) {
            self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        } else {
            self.blurEffect = nil;
        }
    }
    return _blurEffect;
}

#pragma mark 约束
//自定义视图的约束
- (NSLayoutConstraint *)customConstant_offX {
    if (!_customConstant_offX) {
        self.customConstant_offX = [NSLayoutConstraint constraintWithItem:_customView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_bgView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [_bgView addConstraint:_customConstant_offX];
    }
    return _customConstant_offX;
}

- (NSLayoutConstraint *)customConstant_offY {
    if (!_customConstant_offY) {
        self.customConstant_offY = [NSLayoutConstraint constraintWithItem:_customView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_bgView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [_bgView addConstraint:_customConstant_offY];
    }
    return _customConstant_offY;
}

- (NSLayoutConstraint *)customConstant_width {
    if (!_customConstant_width) {
        self.customConstant_width = [NSLayoutConstraint constraintWithItem:_customView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:0];
        [_bgView addConstraint:_customConstant_width];
    }
    return _customConstant_width;
}

- (NSLayoutConstraint *)customConstant_height {
    if (!_customConstant_height) {
        self.customConstant_height = [NSLayoutConstraint constraintWithItem:_customView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:0];
        [_bgView addConstraint:_customConstant_height];
    }
    return _customConstant_height;
}

//label的约束
- (NSLayoutConstraint *)labelConstant_offX {
    if (!_labelConstant_offX) {
        self.labelConstant_offX = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [_smallWindowView addConstraint:_labelConstant_offX];
    }
    return _labelConstant_offX;
}

- (NSLayoutConstraint *)labelConstant_offY {
    if (!_labelConstant_offY) {
        self.labelConstant_offY = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_smallWindowView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [_smallWindowView addConstraint:_labelConstant_offY];
    }
    return _labelConstant_offY;
}

- (NSLayoutConstraint *)labelConstant_width {
    if (!_labelConstant_width) {
        self.labelConstant_width = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:0];
        [_smallWindowView addConstraint:_labelConstant_width];
    }
    return _labelConstant_width;
}

- (NSLayoutConstraint *)labelConstant_height {
    if (!_labelConstant_height) {
        self.labelConstant_height = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:0];
        [_smallWindowView addConstraint:_labelConstant_height];
    }
    return _labelConstant_height;
}

#pragma mark - setter
- (void)setStyle:(QBProgressHUDStyle)style {
    if (_style != style) {
        _style = style;
        if (isLayouted) {
            [self updateAttributesAnimated:YES];
        }
    }
}

- (void)setCustomView:(UIView *)customView
{
    [_customView removeFromSuperview];
    _customView = nil;
    _customConstant_offX = nil;
    _customConstant_offY = nil;
    _customConstant_width = nil;
    _customConstant_height = nil;
    _customView = customView;
    _customView.center = CGPointMake(_bgView.width / 2.0, _bgView.height / 2.0);
}

- (void)setTitle:(NSString *)title {
    if (![_title isEqualToString:title]) {
        if (_titleLabel) {
            _titleLabel.text = title;
            [self updateAttributesAnimated:YES];
        }
    }
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    if (_titleLabel) {
        _titleLabel.textColor = titleColor;
    }
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    if (_titleLabel) {
        _titleLabel.font = _titleFont;
        [self updateAttributesAnimated:YES];
    }
}

- (void)setIndicatorColor:(UIColor *)indicatorColor {
    _indicatorColor = indicatorColor;
    if (_indicatorView) {
        _indicatorView.color = indicatorColor;
    }
}

- (void)setOffX:(CGFloat)offX {
    if (_offX != offX) {
        _offX = offX;
        [self layoutBgView];
    }
}

- (void)setOffY:(CGFloat)offY {
    if (_offY != offY) {
        _offY = offY;
        [self layoutBgView];
    }
}

- (void)setEffectStyle:(QBProgressHUDBlurEffectStyle)effectStyle
{
    _effectStyle = effectStyle;
    if (_effectStyle == QBProgressHUDBlurEffectStyleLight) {
        _blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    } else if (_effectStyle == QBProgressHUDBlurEffectStyleDark) {
        _blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    } else {
        _blurEffect = nil;
    }
    
    if (_blurEffectView) {
        _blurEffectView.effect = _blurEffect;
    }
}

#pragma mark - action
- (void)show:(BOOL)animated {
    NSAssert([NSThread isMainThread], @"HUD的视图操作必须在主线程上");
    useAnimation = animated;
    if (!isShowing) {
        [self updateAttributesAnimated:NO];
    }
    [self showUsingAnimation:useAnimation];
}

- (void)hide:(BOOL)animated {
    NSAssert([NSThread isMainThread], @"HUD的视图操作必须在主线程上");
    useAnimation = animated;
    [self hideUsingAnimation:useAnimation];
}

- (void)hide:(BOOL)animated after:(NSTimeInterval)delay {
    [self performSelector:@selector(hideDelayed:) withObject:[NSNumber numberWithBool:animated] afterDelay:delay];
}

- (void)hideDelayed:(NSNumber *)animated {
    [self hide:[animated boolValue]];
}

#pragma mark - show & hide
- (void)showUsingAnimation:(BOOL)animated {
    // 调用此方法之前，取消所有的未执行的方法
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self setNeedsDisplay];
    
    if (animated && _animationStyle == QBProgressHUDAnimationZoomIn) {
        _bgView.transform = CGAffineTransformConcat(rotationTransform, CGAffineTransformMakeScale(0.5f, 0.5f));
    } else if (animated && _animationStyle == QBProgressHUDAnimationZoomOut) {
        _bgView.transform = CGAffineTransformConcat(rotationTransform, CGAffineTransformMakeScale(1.5f, 1.5f));
    }
    
    isShowing = YES;

    // 淡入
    if (animated) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.30];
        self.alpha = 1.0f;
        if (_animationStyle == QBProgressHUDAnimationZoomIn || _animationStyle == QBProgressHUDAnimationZoomOut) {
            _bgView.transform = rotationTransform;
        }
        [UIView commitAnimations];
    } else {
        self.alpha = 1.0f;
    }
}

- (void)hideUsingAnimation:(BOOL)animated {
    //淡出
    if (animated && isShowing) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.30];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
        
        if (_animationStyle == QBProgressHUDAnimationZoomIn) {
            _bgView.transform = CGAffineTransformConcat(rotationTransform, CGAffineTransformMakeScale(1.5f, 1.5f));
        } else if (_animationStyle == QBProgressHUDAnimationZoomOut) {
            _bgView.transform = CGAffineTransformConcat(rotationTransform, CGAffineTransformMakeScale(0.5f, 0.5f));
        }
        
        self.alpha = 0.02f;
        [UIView commitAnimations];
    }
    else {
        self.alpha = 0.0f;
        [self done];
    }
    isShowing = NO;
}

- (void)animationFinished:(NSString *)animationID finished:(BOOL)finished context:(void*)context {
    [self done];
}

- (void)done
{
    //取消所有的事件队列
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    isFinished = YES;
    if (_indicatorView) {
        [_indicatorView stopAnimating];
    }
    self.alpha = 0.0f;
    [self removeFromSuperview];
    if (self.completionBlock) {
        self.completionBlock();
        self.completionBlock = NULL;
    }
}

#pragma mark - helper
//计算labe上文字所需的大小
- (CGSize)getSizeLabel:(UILabel *)label width:(CGFloat)width
{
    if (!label) {
        return CGSizeZero;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = label.textAlignment;
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    NSDictionary *attributes = @{NSFontAttributeName:label.font, NSParagraphStyleAttributeName:paragraphStyle};
    
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size;
    return size;
}

@end
