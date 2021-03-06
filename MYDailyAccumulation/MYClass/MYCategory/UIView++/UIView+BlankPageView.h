//
//  UIView+BlankPageView.h
//  MeiYiQuan
//
//  Created by Mayer on 16/10/4.
//  Copyright © 2016年 Mayer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlankPageView.h"

@interface UIView (BlankPageView)

@property (nonatomic, strong) BlankPageView *blankPageView;

- (void)configBlankPage:(BlankPageType)blankPageType hasData:(BOOL)hasData noDataStr:(NSString *)noDataStr hasError:(BOOL)hasError errorStr:(NSString *)errorStr reloadButtonBlock:(void(^)(id sender))block;

@end
