//
//  NSString+Extension.m
//  HaircutRoom
//
//  Created by Mayer on 2017/8/2.
//  Copyright © 2017年 美艺圈. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (BOOL)isEmpty{
    if (self == nil) {
        return YES;
    }
    NSString *str = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return str.length == 0;

}
@end
