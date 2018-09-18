//
//  MTextView.h
//  HaircutRoom
//
//  Created by Mayer on 2017/7/18.
//  Copyright © 2017年 美艺圈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;

/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
//- (instancetype)initTextViewWithPlaceholder:(NSString *)placeholder;
@end
