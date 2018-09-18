//
//  UIImage+Cache.h
//  NeiQuanProject
//
//  Created by Mayer on 16/12/25.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Cache)

#pragma mark - 将图片存入沙盒
- (void)saveToCacheWithKey:(NSString *)key;
#pragma mark - 将图片从沙盒取出
+ (UIImage *)loadFromCacheWithKey:(NSString *)key;

@end
