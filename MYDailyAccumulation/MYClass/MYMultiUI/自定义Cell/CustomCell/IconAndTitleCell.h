//
//  IconAndTitleCell.h
//  MeiYiQuan
//
//  Created by Mayer on 16/10/5.
//  Copyright © 2016年 Mayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IconAndTitleCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

- (void)configCellIconName:(NSString *)iconName cellTitle:(NSString *)cellTitle showLine:(BOOL)isShowLine;

@end
