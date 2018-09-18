//
//  UIButton+Block.m
//  allrichstore
//
//  Created by Mayer on 16/11/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIButton+Block.h"

@implementation UIButton (Block)

static char overviewKey;

@dynamic event;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(BtnActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

- (void)callActionBlock:(id)sender {
    BtnActionBlock block = (BtnActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}

@end
