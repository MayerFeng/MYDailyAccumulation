//
//  InsetLabel.m
//  NeiQuanProject
//
//  Created by Mayer on 16/12/25.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import "InsetLabel.h"  //支持Inset的label

@implementation InsetLabel

#pragma mark - 重写绘制
- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _contentInset)];
}

#pragma mark - label刚好需要的size
- (CGSize)contentSize
{
    CGRect rect = UIEdgeInsetsInsetRect(self.bounds, _contentInset);
    CGSize size = [super getSizeWithWidth:rect.size.width];
    return CGSizeMake(size.width + _contentInset.left + _contentInset.right, size.height + _contentInset.top + _contentInset.bottom);
}

#pragma mark - 文字刚好需要的size
- (CGSize)textSizeIn:(CGSize)size
{
    size.width -= _contentInset.left + _contentInset.right;
    size.height -= _contentInset.top + _contentInset.bottom;
    CGSize textSize = [super getSizeWithWidth:size.width];
    return CGSizeMake(textSize.width + _contentInset.left + _contentInset.right, textSize.height + _contentInset.top + _contentInset.bottom);
}

@end
