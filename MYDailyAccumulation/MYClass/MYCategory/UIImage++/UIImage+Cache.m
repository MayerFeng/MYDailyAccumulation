//
//  UIImage+Cache.m
//  NeiQuanProject
//
//  Created by Mayer on 16/12/25.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import "UIImage+Cache.h"

@implementation UIImage (Cache)

#pragma mark - 将图片存入沙盒
//将图片存入沙盒
- (void)saveToCacheWithKey:(NSString *)key
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *tmpPath = [UIImage getTemporaryPath];
        NSString *imagePath = [NSString stringWithFormat:@"%@/%@", tmpPath, [key md5]];
        
        NSData *data = nil;
        if (UIImagePNGRepresentation(self) == nil)
        {
            data = UIImageJPEGRepresentation(self, 1);
        }
        else
        {
            data = UIImagePNGRepresentation(self);
        }
        [data writeToFile:imagePath atomically:YES];
    });
}

#pragma mark - 将图片从沙盒取出
//将图片从沙盒取出
+ (UIImage *)loadFromCacheWithKey:(NSString *)key
{
    NSString *tmpPath = [UIImage getTemporaryPath];
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@", tmpPath, [key md5]];
    return [UIImage imageWithContentsOfFile:imagePath];
}


#pragma mark - helper
+ (NSString *)getTemporaryPath
{
    return NSTemporaryDirectory();
}

@end
