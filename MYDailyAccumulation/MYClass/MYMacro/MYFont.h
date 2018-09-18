//
//  MYFont.h
//  MYNewDemo
//
//  Created by Mayer on 16/10/21.
//  Copyright © 2018年 TJMYQ. All rights reserved.
//

#ifndef MYFont_h
#define MYFont_h

#pragma mark - 通用
//#define Font(x) [UIFont fontWithName:@"清茶楷体预览版" size:x]
#define Font(x)      [UIFont systemFontOfSize:x]
#define BoldFont(x)  [UIFont boldSystemFontOfSize:x]

//#define AdaptedFont(x)    [UIFont fontWithName:@"清茶楷体预览版" size:FloatAdapted(x)]
#define AdaptedFont(x)     [UIFont systemFontOfSize:FloatAdapted(x)]
#define AdaptedBoldFont(x) [UIFont boldSystemFontOfSize:FloatAdapted(x)]

#define LightAdaptedFont(x)     [UIFont systemFontOfSize:LightAdapted(x)]

#pragma mark - 工程字体配置
/***************BaseCell的控件字体***************/
#define BaseFont_Cell_Title     AdaptedBoldFont(16)
#define BaseFont_Cell_Context   Font(12)
#define BaseFont_Cell_Time      AdaptedFont(13)


//中文字体
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]

#endif /* MYFont_h */
