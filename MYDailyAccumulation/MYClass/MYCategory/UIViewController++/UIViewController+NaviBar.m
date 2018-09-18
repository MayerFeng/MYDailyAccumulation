//
//  UIViewController+NaviBar.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/9.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "UIViewController+NaviBar.h"

static void *leftBtnsArrayKey   = &leftBtnsArrayKey;
static void *rightBtnsArrayKey = &rightBtnsArrayKey;

@implementation UIViewController (NaviBar)

#pragma mark - 设置导航栏图片按钮
- (void)addLeftImage:(UIImage *)image action:(SEL)action
{
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:action];
    [self.leftBtnsArray addObject:barBtnItem];
    self.navigationItem.leftBarButtonItems = self.leftBtnsArray;
}

- (void)addRightImage:(UIImage *)image action:(SEL)action
{
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:action];
    [self.rightBtnsArray addObject:barBtnItem];
    self.navigationItem.rightBarButtonItems = self.rightBtnsArray;
}

#pragma mark - 设置导航栏文字按钮
- (void)addLeftTitle:(NSString *)title action:(SEL)action
{
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleDone target:self action:action];
    [self.leftBtnsArray addObject:barBtnItem];
    self.navigationItem.leftBarButtonItems = self.leftBtnsArray;
}

- (void)addRightTitle:(NSString *)title action:(SEL)action
{
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleDone target:self action:action];
    [self.rightBtnsArray addObject:barBtnItem];
    self.navigationItem.rightBarButtonItems = self.rightBtnsArray;
}

#pragma mark - 设置导航栏自定义按钮
- (void)addLeftBtn:(UIButton *)btn action:(SEL)action
{
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtnsArray addObject:barBtnItem];
    self.navigationItem.leftBarButtonItems = self.leftBtnsArray;
}

- (void)addRightBtn:(UIButton *)btn action:(SEL)action
{
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtnsArray addObject:barBtnItem];
    self.navigationItem.rightBarButtonItems = self.rightBtnsArray;
}

#pragma mark - 移除导航按钮
- (void)removeAllLeftBtns
{
    [self.leftBtnsArray removeAllObjects];
    self.navigationItem.leftBarButtonItems = self.leftBtnsArray;
}

- (void)removeAllRightBtns
{
    [self.rightBtnsArray removeAllObjects];
    self.navigationItem.rightBarButtonItems = self.rightBtnsArray;
}

#pragma mark - setter getter
- (void)setLeftBtnsArray:(NSMutableArray *)leftBtnsArray
{
    objc_setAssociatedObject(self, &leftBtnsArrayKey, leftBtnsArray, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableArray *)leftBtnsArray
{
    NSMutableArray *array = objc_getAssociatedObject(self, &leftBtnsArrayKey);
    if (!array) {
        array = [NSMutableArray array];
        objc_setAssociatedObject(self, &leftBtnsArrayKey, array, OBJC_ASSOCIATION_RETAIN);
    }
    return array;
}

- (void)setRightBtnsArray:(NSMutableArray *)rightBtnsArray
{
    objc_setAssociatedObject(self, &rightBtnsArrayKey, rightBtnsArray, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableArray *)rightBtnsArray
{
    NSMutableArray *array = objc_getAssociatedObject(self, &rightBtnsArrayKey);
    if (!array) {
        array = [NSMutableArray array];
        objc_setAssociatedObject(self, &rightBtnsArrayKey, array, OBJC_ASSOCIATION_RETAIN);
    }
    return array;
}

@end
