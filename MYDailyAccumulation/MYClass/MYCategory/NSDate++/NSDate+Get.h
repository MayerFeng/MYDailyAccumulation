//
//  NSDate+Get.h
//  NeiQuanProject
//
//  Created by Mayer on 17/1/9.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DATE_COMPONENTS (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

@interface NSDate (Get)

#pragma mark - N天后的时间
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days;
#pragma mark - N天前的时间
+ (NSDate *)dateWithDaysBeforeNow:(NSInteger)days;
#pragma mark - 明天同一时刻的时间
+ (NSDate *)dateTomorrow;
#pragma mark - 明天同一时刻的时间
+ (NSDate *)dateYesterday;
#pragma mark - N小时后的时间
+ (NSDate *)dateWithHoursFromNow:(NSInteger)dHours;
#pragma mark - N小时前的时间
+ (NSDate *)dateWithHoursBeforeNow:(NSInteger)dHours;
#pragma mark - N分钟后的时间
+ (NSDate *)dateWithMinutesFromNow:(NSInteger)dMinutes;
#pragma mark - N分钟前的时间
+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger)dMinutes;
#pragma mark - 某个时间之后N天的时间
- (NSDate *)dateByAddingDays:(NSInteger)dDays;
#pragma mark - 某个时间之前N天的时间
- (NSDate *)dateBySubtractingDays:(NSInteger)dDays;
#pragma mark - 某个时间之后N小时的时间
- (NSDate *)dateByAddingHours:(NSInteger)dHours;
#pragma mark - 某个时间之前N小时的时间
- (NSDate *)dateBySubtractingHours:(NSInteger)dHours;
#pragma mark - 某个时间之后N分钟的时间
- (NSDate *)dateByAddingMinutes:(NSInteger)dMinutes;
#pragma mark - 某个时间之前N分钟的时间
- (NSDate *)dateBySubtractingMinutes:(NSInteger)dMinutes;
#pragma mark - 今天凌晨的时间
- (NSDate *)dateAtStartOfDay;
#pragma mark - 一个时间的时间组件
- (NSDateComponents *)componentsWithOffsetFromDate:(NSDate *)aDate;
#pragma mark - 当前时间在某个时间之后的分钟个数
- (NSInteger)minutesAfterDate:(NSDate *)aDate;
#pragma mark - 当前时间在某个时间之前的分钟个数
- (NSInteger)minutesBeforeDate:(NSDate *)aDate;
#pragma mark - 当前时间在某个时间之后的小时个数
- (NSInteger)hoursAfterDate:(NSDate *)aDate;
#pragma mark - 当前时间在某个时间之前的小时个数
- (NSInteger)hoursBeforeDate:(NSDate *)aDate;
#pragma mark - 当前时间在某个时间之后的天数
- (NSInteger)daysAfterDate:(NSDate *)aDate;
#pragma mark - 当前时间在某个时间之前的天数
- (NSInteger)daysBeforeDate:(NSDate *)aDate;
#pragma mark - 当前时间距离某个时间的天数
- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate;
#pragma mark - 根据出生日期转换成星座名
- (NSString *)formatToConstellation;

#pragma mark - 根据出生日期转换成星座码
- (NSString *)formatToConstellationCode;

#pragma mark - 只读属性
@property (nonatomic, readonly) NSInteger nearestHour;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger seconds;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger week;
@property (nonatomic, readonly) NSInteger weekday;
@property (nonatomic, readonly) NSInteger nthWeekday;
@property (nonatomic, readonly) NSInteger year;

@end
