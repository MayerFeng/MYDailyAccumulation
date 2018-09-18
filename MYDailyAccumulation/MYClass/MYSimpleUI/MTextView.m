//
//  MTextView.m
//  HaircutRoom
//
//  Created by Mayer on 2017/7/18.
//  Copyright © 2017年 美艺圈. All rights reserved.
//

#import "MTextView.h"

@implementation MTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    if (self.hasText) return ;
    
    //文字属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor lightGrayColor];
    if (self.font) {
        dict[NSFontAttributeName] = self.font;
    }
    
    //画文字
    [self.placeholder drawInRect:CGRectMake(5, 8, self.width-5*2, self.height) withAttributes:dict];
}

- (void)textDidChange {
    //重绘
    [self setNeedsDisplay];
    
    //NSLog(@"textDidChange");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//- (instancetype)initTextViewWithPlaceholder:(NSString *)placeholder {
//    if (self = [super init]) {
//        UILabel *placeHolderLabel = [[UILabel alloc] init];
//        placeHolderLabel.text = placeholder;
//        placeHolderLabel.numberOfLines = 0;
//        placeHolderLabel.textColor = [UIColor lightGrayColor];
//        [placeHolderLabel sizeToFit];
//        [self addSubview:placeHolderLabel];
//        self.font = [UIFont systemFontOfSize:13.f];
//        placeHolderLabel.font = [UIFont systemFontOfSize:13.f];
//        
//        [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
//    }
//   
//    
//    return self;
//}

@end
