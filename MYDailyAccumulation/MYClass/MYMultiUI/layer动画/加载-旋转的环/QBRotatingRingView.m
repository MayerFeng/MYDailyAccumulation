//
//  QBRotatingRingView.m
//  NeiQuanProject
//
//  Created by Mayer on 16/11/15.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import "QBRotatingRingView.h"  //加载（圆环旋转）

static CGFloat kMargin = 5; //四周边距
@interface QBRotatingRingView ()

//展示动画的layer
@property (nonatomic, strong) CAShapeLayer *animatedLayer;

@end

@implementation QBRotatingRingView

#pragma mark - override
- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        [self layoutAnimatedLayer];
    } else {
        [_animatedLayer removeFromSuperlayer];
        _animatedLayer = nil;
    }
}

#pragma mark - custom
- (void)layoutAnimatedLayer {
    CALayer *layer = self.animatedLayer;
    [self.layer addSublayer:layer];
    
    CGFloat widthDiff = CGRectGetWidth(self.bounds) - CGRectGetWidth(layer.bounds);
    CGFloat heightDiff = CGRectGetHeight(self.bounds) - CGRectGetHeight(layer.bounds);
    layer.position = CGPointMake(CGRectGetWidth(self.bounds) - CGRectGetWidth(layer.bounds) / 2 - widthDiff / 2, CGRectGetHeight(self.bounds) - CGRectGetHeight(layer.bounds) / 2 - heightDiff / 2);
}

#pragma mark - getter
//懒加载animatedLayer
- (CAShapeLayer *)animatedLayer {
    if (!_animatedLayer) {
        //圆心
        CGPoint ringCenter = CGPointMake(_radius + _strokeWidth / 2.0 + kMargin, _radius + _strokeWidth / 2.0 + kMargin);
        //绘制圆的路径
        UIBezierPath *ringPath = [UIBezierPath bezierPathWithArcCenter:ringCenter radius:_radius startAngle:(CGFloat)(M_PI * 3 / 2) endAngle:(CGFloat)(M_PI / 2 + M_PI * 5) clockwise:YES];
        self.animatedLayer = [CAShapeLayer layer];
        _animatedLayer.contentsScale = [[UIScreen mainScreen] scale];
        _animatedLayer.frame = CGRectMake(.0, .0, ringCenter.x * 2.0, ringCenter.y * 2.0);
        _animatedLayer.fillColor = [UIColor clearColor].CGColor;
        _animatedLayer.strokeColor = _strokeColor.CGColor;
        _animatedLayer.lineWidth = _strokeWidth;
        _animatedLayer.lineCap = kCALineCapRound;
        _animatedLayer.lineJoin = kCALineJoinBevel;
        _animatedLayer.path = ringPath.CGPath;
        
        //加个渐变蒙版
        CALayer *maskLayer = [CALayer layer];
        maskLayer.contents = (__bridge id)([[UIImage imageNamed:@"rotatingRing-mask"] CGImage]);
        maskLayer.frame = _animatedLayer.bounds;
        _animatedLayer.mask = maskLayer;
        
        NSTimeInterval animationDuration = 1;
        CAMediaTimingFunction *linearCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation.fromValue = @(0);
        animation.toValue = @(M_PI*2);
        animation.duration = animationDuration;
        animation.timingFunction = linearCurve;
        animation.removedOnCompletion = NO;
        animation.repeatCount = INFINITY;
        animation.fillMode = kCAFillModeForwards;
        animation.autoreverses = NO;
        [_animatedLayer.mask addAnimation:animation forKey:@"rotate"];
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = INFINITY;
        animationGroup.removedOnCompletion = NO;
        animationGroup.timingFunction = linearCurve;
        
        CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        strokeStartAnimation.fromValue = @0.015;
        strokeStartAnimation.toValue = @0.515;
        
        CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        strokeEndAnimation.fromValue = @0.485;
        strokeEndAnimation.toValue = @0.985;
        
        animationGroup.animations = @[strokeStartAnimation, strokeEndAnimation];
        [_animatedLayer addAnimation:animationGroup forKey:@"progress"];
    }
    
    return _animatedLayer;
}

#pragma mark - setter
- (void)setFrame:(CGRect)frame {
    if(!CGRectEqualToRect(frame, super.frame)) {
        [super setFrame:frame];
        if(self.superview) {
            [self layoutAnimatedLayer];
        }
    }
    
}

- (void)setRadius:(CGFloat)radius {
    if(radius != _radius) {
        _radius = radius;
        [_animatedLayer removeFromSuperlayer];
        _animatedLayer = nil;
        
        if(self.superview) {
            [self layoutAnimatedLayer];
        }
    }
}

- (void)setStrokeColor:(UIColor*)strokeColor {
    _strokeColor = strokeColor;
    _animatedLayer.strokeColor = strokeColor.CGColor;
}

- (void)setStrokeWidth:(CGFloat)strokeWidth {
    if (_strokeWidth != strokeWidth) {
        _strokeWidth = strokeWidth;
        _animatedLayer.lineWidth = _strokeWidth;
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake((self.radius + self.strokeWidth / 2 + kMargin) * 2, (self.radius + self.strokeWidth / 2 + 5) * 2);
}

@end
