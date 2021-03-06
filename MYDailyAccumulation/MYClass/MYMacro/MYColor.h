//
//  MYColor.h
//  MYNewDemo
//
//  Created by Mayer on 16/10/21.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#ifndef MYColor_h
#define MYColor_h
//半透明
#define qbColor_transitionBg    [UIColor colorWithWhite:0.0 alpha:0.3]

//黑
#define qbBlackColor    [UIColor colorWithWhite:0.15 alpha:1.0]
//红
#define qbRedColor    [UIColor colorWithRed:232 / 255.0 green:35 / 255.0 blue:45 / 255.0 alpha:1.0]

/***************BaseCell的控件颜色***************/
#define BaseColor_Cell_Backgound        [UIColor whiteColor]
#define BaseColor_Cell_SelectedBackground [UIColor colorWithRed:232 / 255.0 green:232 / 255.0 blue:234 / 255.0 alpha:1.0]

#define BaseColor_Cell_TitleLabel_Text  [UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1.0]
#define BaseColor_Cell_ContextLabel_Text    [UIColor colorWithWhite:0.45 alpha:1.0]
#define BaseColor_Cell_TimeLabel_Text   [UIColor colorWithWhite:0.6 alpha:1.0]
#define BaseColor_Cell_SplitLine        [UIColor colorWithWhite:0.89 alpha:1.0]


#define BlackTextColor   [UIColor colorWithWhite:0.2 alpha:1.0]

#pragma mark - 取色工具
/***************取色工具***************/
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

// 取色值相关的方法
#ifndef RGB
#define RGB(r,g,b)          [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#endif

#ifndef RGBA
#define RGBA(r,g,b,a)       [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
#endif

#define RGBOF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define RGBA_OF(rgbValue)   [UIColor colorWithRed:((float)(((rgbValue) & 0xFF000000) >> 24))/255.0 \
green:((float)(((rgbValue) & 0x00FF0000) >> 16))/255.0 \
blue:((float)(rgbValue & 0x0000FF00) >> 8)/255.0 \
alpha:((float)(rgbValue & 0x000000FF))/255.0]

#define RGBAOF(v, a)        [UIColor colorWithRed:((float)(((v) & 0xFF0000) >> 16))/255.0 \
green:((float)(((v) & 0x00FF00) >> 8))/255.0 \
blue:((float)(v & 0x0000FF))/255.0 \
alpha:a]

#endif /* MYColor_h */
