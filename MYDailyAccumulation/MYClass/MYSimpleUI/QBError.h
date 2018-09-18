//
//  QBError.h
//  HaircutRoom
//
//  Created by Mayer on 17/3/13.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QBError : NSError

//是否已经处理
@property (nonatomic,assign) BOOL isHandled;

@end
