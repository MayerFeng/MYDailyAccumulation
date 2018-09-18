//
//  QBRotatingRingView.h
//  NeiQuanProject
//
//  Created by Mayer on 16/11/15.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QBRotatingRingView : UIView

//圆环的颜色
@property (nonatomic, strong) UIColor *strokeColor;
//圆环的宽
@property (nonatomic, assign) CGFloat strokeWidth;
//圆环的半径
@property (nonatomic, assign) CGFloat radius;

@end
