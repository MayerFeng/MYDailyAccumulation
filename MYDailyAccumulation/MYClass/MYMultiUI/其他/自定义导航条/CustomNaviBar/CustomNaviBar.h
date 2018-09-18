//
//  CustomNaviBar.h
//  allrichstore
//
//  Created by Mayer on 16/10/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CustomNaviBarStyle) {
    CustomNaviBarStyleTranslucent = 0,
    CustomNaviBarStyleOpaque
};

@interface CustomNaviBar : UIView
{

}

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIView *backGoundView;


@end
