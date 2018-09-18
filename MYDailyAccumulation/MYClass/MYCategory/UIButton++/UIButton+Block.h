//
//  UIButton+Block.h
//  allrichstore
//
//  Created by Mayer on 16/11/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void(^BtnActionBlock)(void);

@interface UIButton (Block)

@property (readonly) NSMutableDictionary *event;

- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(BtnActionBlock)action;

@end
