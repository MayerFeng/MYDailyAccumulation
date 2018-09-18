//
//  NSDate+Judge.m
//  NeiQuanProject
//
//  Created by Mayer on 16/12/8.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import "NSDate+Judge.h"
#import "NSDate+Get.h"

@implementation NSDate (Judge)

#pragma mark - 与另外一个时间是同一天？
- (BOOL)isSameDayToDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

#pragma mark - 是今天？
- (BOOL)isToday
{
    return [self isSameDayToDate:[NSDate date]];
}

#pragma mark - 是明天？
- (BOOL)isTomorrow
{
    return [self isSameDayToDate:[NSDate dateTomorrow]];
}

#pragma mark - 是昨天？
- (BOOL)isYesterday
{
    return [self isSameDayToDate:[NSDate dateYesterday]];
}

#pragma mark - 与另外一个时间是同一周？
- (BOOL)isSameWeekAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate];

    if (components1.weekOfYear != components2.weekOfYear) return NO;
    
    return (fabs([self timeIntervalSinceDate:aDate]) < D_WEEK);
}

#pragma mark - 是本周？
- (BOOL)isThisWeek
{
    return [self isSameWeekAsDate:[NSDate date]];
}

#pragma mark - 是下周？
- (BOOL)isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self isSameWeekAsDate:newDate];
}

#pragma mark - 是上周？
- (BOOL)isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self isSameWeekAsDate:newDate];
}

#pragma mark - 与另外一个时间是同一月?
- (BOOL)isSameMonthAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

#pragma mark - 是本月？
- (BOOL)isThisMonth
{
    return [self isSameMonthAsDate:[NSDate date]];
}

#pragma mark - 与另外一个时间是同一年？
- (BOOL)isSameYearAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

#pragma mark - 是今年？
- (BOOL)isThisYear
{
    return [self isSameYearAsDate:[NSDate date]];
}

#pragma mark - 是明年？
- (BOOL)isNextYear
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:[NSDate date]];
    return (components1.year == (components2.year + 1));
}

#pragma mark - 是去年？
- (BOOL)isLastYear
{
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year - 1));
}

#pragma mark - 比某个日期早？
- (BOOL)isEarlierThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

#pragma mark - 比某个日期晚？
- (BOOL)isLaterThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

#pragma mark - 是未来？
- (BOOL)isInFuture
{
    return ([self isLaterThanDate:[NSDate date]]);
}

#pragma mark - 是过去？
- (BOOL)isInPast
{
    return ([self isEarlierThanDate:[NSDate date]]);
}

#pragma mark - 是否是通常的礼拜天？
- (BOOL)isTypicallyWeekend
{
    NSDateComponents *components = [CURRENT_CALENDAR components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1) ||
        (components.weekday == 7))
        return YES;
    return NO;
}

#pragma mark - 是否是通常的工作日？
- (BOOL)isTypicallyWorkday
{
    return ![self isTypicallyWeekend];
}

@end
