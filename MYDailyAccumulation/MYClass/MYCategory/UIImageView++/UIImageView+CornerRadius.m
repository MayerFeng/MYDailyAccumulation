//
//  UIImageView+CornerRadius.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIImageView+CornerRadius.h"
#import <objc/runtime.h>

@interface UIImage (cornerRadius)

@property (nonatomic, assign) BOOL cornerRadius;

@end

@implementation UIImage (cornerRadius)

- (BOOL)cornerRadius {
    return [objc_getAssociatedObject(self, @selector(cornerRadius)) boolValue];
}

- (void)setCornerRadius:(BOOL)cornerRadius {
    objc_setAssociatedObject(self, @selector(cornerRadius), @(cornerRadius), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

/////////////////////////////////////////////////////////////////////
@interface ImageObserver : NSObject

@property (nonatomic, assign) UIImageView *originImageView;
@property (nonatomic, strong) UIImage *originImage;
@property (nonatomic, assign) CGFloat cornerRadius;

- (instancetype)initWithImageView:(UIImageView *)imageView;

@end

@implementation ImageObserver

- (void)dealloc {
    [self.originImageView removeObserver:self forKeyPath:@"image"];
    [self.originImageView removeObserver:self forKeyPath:@"contentMode"];
}

- (instancetype)initWithImageView:(UIImageView *)imageView{
    if (self = [super init]) {
        self.originImageView = imageView;
        [imageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        [imageView addObserver:self forKeyPath:@"contentMode" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString*, id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[@"new"];
        if (![newImage isKindOfClass:[UIImage class]] || newImage.cornerRadius) {
            return;
        }
        [self updateImageView];
    }
    if ([keyPath isEqualToString:@"contentMode"]) {
        self.originImageView.image = self.originImage;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (_cornerRadius == cornerRadius) {
        return;
    }
    _cornerRadius = cornerRadius;
    if (_cornerRadius > 0) {
        [self updateImageView];
    }
}

- (void)updateImageView {
    self.originImage = self.originImageView.image;
    if (!self.originImage) {
        return;
    }
    
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(self.originImageView.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    if (currnetContext) {
        CGContextAddPath(currnetContext, [UIBezierPath bezierPathWithRoundedRect:self.originImageView.bounds cornerRadius:self.cornerRadius].CGPath);
        CGContextClip(currnetContext);
        [self.originImageView.layer renderInContext:currnetContext];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    if ([image isKindOfClass:[UIImage class]]) {
        image.cornerRadius = YES;
        self.originImageView.image = image;
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateImageView];
        });
    }
}

@end

/////////////////////////////////////////////////////////////////////
@implementation UIImageView (CornerRadius)

- (CGFloat)cornerRadius {
    return [self imageObserver].cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    [self imageObserver].cornerRadius = cornerRadius;
}

- (ImageObserver *)imageObserver {
    ImageObserver *imageObserver = objc_getAssociatedObject(self, @selector(imageObserver));
    if (!imageObserver) {
        imageObserver = [[ImageObserver alloc] initWithImageView:self];
        objc_setAssociatedObject(self, @selector(imageObserver), imageObserver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return imageObserver;
}

@end
