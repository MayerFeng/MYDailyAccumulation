//
//  UIViewController+NaviBar.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/9.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NaviBar)

#pragma mark - 设置导航栏图片按钮
- (void)addLeftImage:(UIImage *)image action:(SEL)action;
- (void)addRightImage:(UIImage *)image action:(SEL)action;

#pragma mark - 设置导航栏文字按钮
- (void)addLeftTitle:(NSString *)title action:(SEL)action;
- (void)addRightTitle:(NSString *)title action:(SEL)action;

#pragma mark - 设置导航栏自定义按钮
- (void)addLeftBtn:(UIButton *)btn action:(SEL)action;
- (void)addRightBtn:(UIButton *)btn action:(SEL)action;

#pragma mark - 移除导航按钮
- (void)removeAllLeftBtns;
- (void)removeAllRightBtns;

#pragma mark - properties
@property (nonatomic, strong) NSMutableArray *leftBtnsArray;
@property (nonatomic, strong) NSMutableArray * rightBtnsArray;

@end
