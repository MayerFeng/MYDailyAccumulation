//
//  GuidePagesView.h
//  MeiYiQuan
//
//  Created by Mayer on 16/10/4.
//  Copyright © 2016年 Mayer. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MainScreen_width  [UIScreen mainScreen].bounds.size.width//宽
#define MainScreen_height [UIScreen mainScreen].bounds.size.height//高

@interface GuidePagesView : UIView

//自定义初始化方法
- (instancetype)initPagesViewWithFrame:(CGRect)frame Images:(NSArray *)images;

@end
