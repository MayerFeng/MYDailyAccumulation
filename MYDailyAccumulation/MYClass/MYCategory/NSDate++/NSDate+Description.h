//
//  NSDate+Description.h
//  NeiQuanProject
//
//  Created by Mayer on 16/12/8.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Description)

#pragma mark - 距离当前的时间间隔描述
- (NSString *)timeIntervalDescription;
#pragma mark - 精确到分钟的日期描述
- (NSString *)minuteDescription;
#pragma mark - 标准时间日期描述
- (NSString *)formattedTime;
#pragma mark - 格式化日期描述
- (NSString *)formattedDateDescription;

+ (NSString *)timeIntervalDesWithSec:(NSUInteger)sec;

//转换成时分秒
+ (NSString *)timeIntervalFormatted_HHMMSS:(NSInteger)totalSeconds;

//转换成时分(汉字)
+ (NSString *)timeIntervalFormatted_HHMM_chinese:(NSInteger)totalSeconds;

#pragma mark - 对某个时间的week描述
+ (NSString *)weekdayStringFromDate:(NSDate *)date;

#pragma mark - 转换成日期格式
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

@end
