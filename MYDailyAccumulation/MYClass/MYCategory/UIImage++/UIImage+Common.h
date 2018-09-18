//
//  UIImage+Common.h
//  MeiYiQuan
//
//  Created by Mayer on 16/9/29.
//  Copyright © 2016年 Mayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)

#pragma mark - 截取控件上的图
+ (UIImage *)imageWithView:(UIView *)view;
#pragma mark - 重置图片的大小
- (UIImage *)reSize:(CGSize)size;
#pragma mark - 裁剪图片
- (UIImage *)cropImageToRect:(CGRect)cropRect;
#pragma mark - 裁剪出四方型
- (UIImage *)cropToSquareImage;
#pragma mark - 初始化纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color;
#pragma mark - 初始化指定大小的纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
#pragma mark - 矫正图片的绘制方向
- (UIImage *)fixOrientation;

@end


#if kSupportUIImageNonCommon

//========================================

@interface UIImage (Cut)

- (UIImage *)clipImageWithScaleWithsize:(CGSize)asize;
- (UIImage *)clipImageWithScaleWithsize:(CGSize)asize roundedCornerImage:(NSInteger)roundedCornerImage borderSize:(NSInteger)borderSize;
@end

//========================================

@interface UIImage (Resize)



- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize transparentBorder:(NSUInteger)borderSize cornerRadius:(NSUInteger)cornerRadius interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode bounds:(CGSize)bounds interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImage:(CGSize)newSize transform:(CGAffineTransform)transform drawTransposed:(BOOL)transpose interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImageInRect:(CGRect)rect transform:(CGAffineTransform)transform drawTransposed:(BOOL)transpose interpolationQuality:(CGInterpolationQuality)quality;

- (CGAffineTransform)transformForOrientation:(CGSize)newSize;

@end

//========================================
@interface UIImage (SplitImageIntoTwoParts)
+ (NSArray*)splitImageIntoTwoParts:(UIImage*)image;
@end

#endif
