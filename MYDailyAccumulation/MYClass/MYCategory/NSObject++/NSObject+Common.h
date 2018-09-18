//
//  NSObject+Common.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/***************block定义***************/
//不带参数的block
typedef void(^EmptyBlock)();
//带一个NSString参数的block
typedef void(^StringBlock)(NSString *string);
//带一个NSArray参数的block
typedef void(^ArrayBlock)(NSArray *array);
//带一个id参数的block
typedef void(^ObjectBlock)(id object);
//带一个参数的block
typedef void(^OneParamBlock)(id obj);

/***************通用枚举*****************/
//触发事件的类型
typedef NS_ENUM(NSUInteger, ActionType)
{
    ActionTypeDefault = 0,
    ActionTypeEdit,
    ActionTypeDelete,
    ActionTypeSelect
};

//级别的类型
typedef NS_ENUM(NSUInteger, LevelType)
{
    LevelTypeOne = 0,
    LevelTypeTwo,
    LevelTypeThree,
};

@interface NSObject (Common)

- (NSString *)className;
+ (NSString *)className;

@end
