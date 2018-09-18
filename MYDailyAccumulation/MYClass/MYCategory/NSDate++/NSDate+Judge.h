//
//  NSDate+Judge.h
//  NeiQuanProject
//
//  Created by Mayer on 16/12/8.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Judge)

#pragma mark - 与另外一个时间是同一天？
- (BOOL)isSameDayToDate:(NSDate *)aDate;
#pragma mark - 是今天？
- (BOOL)isToday;
#pragma mark - 是明天？
- (BOOL)isTomorrow;
#pragma mark - 是昨天？
- (BOOL)isYesterday;

#pragma mark - 与另外一个时间是同一周？
- (BOOL)isSameWeekAsDate:(NSDate *)aDate;
#pragma mark - 是本周？
- (BOOL)isThisWeek;
#pragma mark - 是下周？
- (BOOL)isNextWeek;
#pragma mark - 是上周？
- (BOOL)isLastWeek;

#pragma mark - 与另外一个时间是同一月?
- (BOOL)isSameMonthAsDate:(NSDate *)aDate;
#pragma mark - 是本月？
- (BOOL)isThisMonth;

#pragma mark - 与另外一个时间是同一年？
- (BOOL)isSameYearAsDate:(NSDate *)aDate;
#pragma mark - 是今年？
- (BOOL)isThisYear;
#pragma mark - 是明年？
- (BOOL)isNextYear;
#pragma mark - 是去年？
- (BOOL)isLastYear;

#pragma mark - 比某个日期早？
- (BOOL)isEarlierThanDate:(NSDate *)aDate;
#pragma mark - 比某个日期晚？
- (BOOL)isLaterThanDate:(NSDate *)aDate;
#pragma mark - 是未来？
- (BOOL)isInFuture;
#pragma mark - 是过去？
- (BOOL)isInPast;

#pragma mark - 是否是通常的礼拜天？
- (BOOL)isTypicallyWeekend;
#pragma mark - 是否是通常的工作日？
- (BOOL)isTypicallyWorkday;

@end
