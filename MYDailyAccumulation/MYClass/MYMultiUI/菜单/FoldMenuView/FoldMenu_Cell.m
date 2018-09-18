//
//  FoldMenu_Cell.m
//  allrichstore
//
//  Created by Mayer on 16/11/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FoldMenu_Cell.h"

//cell选中时的背景色
#define kSelectedBgColor    BaseColor_Cell_SelectedBackground

//底线的属性
#define kBottomLineView_Color   [UIColor colorWithWhite:0.92 alpha:1.0];
#define kBottomLineView_Height  0.8

//cell的背景颜色
#define kCell_BgColor   [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1.0]

@implementation FoldMenu_Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.backgroundColor = kCell_BgColor;
        self.clipsToBounds = YES;
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = kSelectedBgColor;
        
        
        self.titleBtn = [QButton buttonWithType:UIButtonTypeCustom];
        _titleBtn.userInteractionEnabled = NO;
        _titleBtn.titleLabel.font = AdaptedFont(16);
        [self.contentView addSubview:_titleBtn];
        
        self.bottomLineView = [UIView new];
        _bottomLineView.backgroundColor = kBottomLineView_Color;
        [self.contentView addSubview:_bottomLineView];
    }
    return self;
}

//添加约束
- (void)makeConstraints
{
    //按钮-添加约束
    _titleBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_titleBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_titleBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_titleBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_titleBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    //按钮-分割线添加约束
    _bottomLineView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_bottomLineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_bottomLineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_bottomLineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_bottomLineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:kBottomLineView_Height]];
}

@end
