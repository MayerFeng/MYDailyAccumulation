//
//  QBTextFiled.m
//  GameLive
//
//  Created by Mayer on 17/2/8.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "QBTextFiled.h" //灵活布局textFiled子控件

@implementation QBTextFiled

- (instancetype)initWithConfig:(OneParamBlock)config {
    
    if (self = [super init]) {
        config(self);
    }
    return self;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    
    CGRect leftViewRect = [super leftViewRectForBounds:bounds];
    leftViewRect.origin.x += _leftViewOffsetX;
    return leftViewRect;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds {
    
    CGRect rightViewRect = [super rightViewRectForBounds:bounds];
    rightViewRect.origin.x += _rightViewOffsetX;
    return rightViewRect;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    
    CGRect textRext = [super textRectForBounds:bounds];
    textRext.origin.x += _textLeftOffsetX;
    textRext.size.width += (-_textLeftOffsetX + _textRightOffsetX);
    return textRext;
    
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    
    CGRect editingRect = [super textRectForBounds:bounds];
    editingRect.origin.x += _textLeftOffsetX;
    editingRect.size.width += (-_textLeftOffsetX + _textRightOffsetX);
    return editingRect;
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds {
    
    CGRect clearBtnRect = [super clearButtonRectForBounds:bounds];
    clearBtnRect.origin.x += _clearBtnOffsetX;
    return clearBtnRect;
}

@end
