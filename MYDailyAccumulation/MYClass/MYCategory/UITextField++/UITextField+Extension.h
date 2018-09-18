//
//  UITextField+Extension.h
//  MobileProject
//
//  Created by wujunyang on 16/7/13.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

- (NSRange)selectedRange;

- (void)setSelectedRange:(NSRange)range;

#pragma mark - 插入字符
- (void)insertWhitSpaceInsertPosition:(NSArray *)insertPosition replacementString:(NSString *)string;

@end
