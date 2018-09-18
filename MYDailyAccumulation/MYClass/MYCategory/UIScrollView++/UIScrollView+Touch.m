//
//  UIScrollView+Touch.m
//  LiveTest
//
//  Created by Mayer on 16/9/7.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import "UIScrollView+Touch.h"

@implementation UIScrollView (Touch)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (![self isKindOfClass:[UIScrollView class]]) {
        
    } else {
        [[self nextResponder] touchesBegan:touches withEvent:event];
        if ([super respondsToSelector:@selector(touchesBegan:withEvent:)]) {
            [super touchesBegan:touches withEvent:event];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (![self isKindOfClass:[UIScrollView class]]) {
        
    } else {
        [[self nextResponder] touchesMoved:touches withEvent:event];
        if ([super respondsToSelector:@selector(touchesBegan:withEvent:)]) {
            [super touchesMoved:touches withEvent:event];
        }
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self isKindOfClass:[UIScrollView class]]) {
        
    } else {
        [[self nextResponder] touchesEnded:touches withEvent:event];
        if ([super respondsToSelector:@selector(touchesBegan:withEvent:)]) {
            [super touchesEnded:touches withEvent:event];
        }
    }
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    
//    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] ||[otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
//        
//        if (self.isOtherGestureResponse)
//        {
//            return YES;
//        }
//        else
//        {
//            return NO;
//        }
//    
//    } else  {
//        return NO;
//    }
//}

@end
