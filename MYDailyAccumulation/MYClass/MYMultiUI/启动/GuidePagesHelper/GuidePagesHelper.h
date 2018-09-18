//
//  GuidePagesHelper.h
//  MeiYiQuan
//
//  Created by Mayer on 16/10/4.
//  Copyright © 2016年 Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuidePagesView.h"

@interface GuidePagesHelper : NSObject

+ (instancetype)shareInstance;

+ (void)showGuidePagesView:(NSArray *)imageArray;

@end
