//
//  NSDate+Get.m
//  NeiQuanProject
//
//  Created by Mayer on 17/1/9.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import "NSDate+Get.h"

@implementation NSDate (Get)

#pragma mark - N天后的时间
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days
{
    return [[NSDate date] dateByAddingDays:days];
}

#pragma mark - N天前的时间
+ (NSDate *)dateWithDaysBeforeNow:(NSInteger)days
{
    return [[NSDate date] dateBySubtractingDays:days];
}

#pragma mark - 明天同一时刻的时间
+ (NSDate *)dateTomorrow
{
    return [NSDate dateWithDaysFromNow:1];
}

#pragma mark - 明天同一时刻的时间
+ (NSDate *)dateYesterday
{
    return [NSDate dateWithDaysBeforeNow:1];
}

#pragma mark - N小时后的时间
+ (NSDate *)dateWithHoursFromNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - N小时前的时间
+ (NSDate *)dateWithHoursBeforeNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - N分钟后的时间
+ (NSDate *)dateWithMinutesFromNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - N分钟前的时间
+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - 某个时间之后N天的时间
- (NSDate *)dateByAddingDays:(NSInteger)dDays
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_DAY * dDays;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - 某个时间之前N天的时间
- (NSDate *)dateBySubtractingDays:(NSInteger)dDays
{
    return [self dateByAddingDays:(dDays * -1)];
}

#pragma mark - 某个时间之后N小时的时间
- (NSDate *)dateByAddingHours:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - 某个时间之前N小时的时间
- (NSDate *)dateBySubtractingHours:(NSInteger)dHours
{
    return [self dateByAddingHours:(dHours * -1)];
}

#pragma mark - 某个时间之后N分钟的时间
- (NSDate *)dateByAddingMinutes:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - 某个时间之前N分钟的时间
- (NSDate *)dateBySubtractingMinutes:(NSInteger)dMinutes
{
    return [self dateByAddingMinutes:(dMinutes * -1)];
}

#pragma mark - 今天凌晨的时间
- (NSDate *)dateAtStartOfDay
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [CURRENT_CALENDAR dateFromComponents:components];
}

#pragma mark - 一个时间的时间组件
- (NSDateComponents *)componentsWithOffsetFromDate:(NSDate *)aDate
{
    NSDateComponents *dTime = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - 当前时间在某个时间之后的分钟个数
- (NSInteger)minutesAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_MINUTE);
}

#pragma mark - 当前时间在某个时间之前的分钟个数
- (NSInteger)minutesBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_MINUTE);
}

#pragma mark - 当前时间在某个时间之后的小时个数
- (NSInteger)hoursAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_HOUR);
}

#pragma mark - 当前时间在某个时间之前的小时个数
- (NSInteger)hoursBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_HOUR);
}

#pragma mark - 当前时间在某个时间之后的天数
- (NSInteger)daysAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_DAY);
}

#pragma mark - 当前时间在某个时间之前的天数
- (NSInteger)daysBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_DAY);
}

#pragma mark - 当前时间距离某个时间的天数
- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}

#pragma mark - 根据出生日期转换成星座名
- (NSString *)formatToConstellation
{
    //计算星座
    NSString *retStr = @"";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM"];
    int i_month = 0;
    NSString *theMonth = [dateFormat stringFromDate:self];
    if([[theMonth substringToIndex:0] isEqualToString:@"0"]){
        i_month = [[theMonth substringFromIndex:1] intValue];
    }else{
        i_month = [theMonth intValue];
    }
    
    [dateFormat setDateFormat:@"dd"];
    int i_day = 0;
    NSString *theDay = [dateFormat stringFromDate:self];
    if([[theDay substringToIndex:0] isEqualToString:@"0"]){
        i_day = [[theDay substringFromIndex:1] intValue];
    }else{
        i_day = [theDay intValue];
    }
    /*
     摩羯座 12月22日------1月19日
     水瓶座 1月20日-------2月18日
     双鱼座 2月19日-------3月20日
     白羊座 3月21日-------4月19日
     金牛座 4月20日-------5月20日
     双子座 5月21日-------6月21日
     巨蟹座 6月22日-------7月22日
     狮子座 7月23日-------8月22日
     处女座 8月23日-------9月22日
     天秤座 9月23日------10月23日
     天蝎座 10月24日-----11月21日
     射手座 11月22日-----12月21日
     */
    switch (i_month) {
        case 1:
            if(i_day>=20 && i_day<=31){
                retStr=@"水瓶座";
            }
            if(i_day>=1 && i_day<=19){
                retStr=@"摩羯座";
            }
            break;
        case 2:
            if(i_day>=1 && i_day<=18){
                retStr=@"水瓶座";
            }
            if(i_day>=19 && i_day<=31){
                retStr=@"双鱼座";
            }
            break;
        case 3:
            if(i_day>=1 && i_day<=20){
                retStr=@"双鱼座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"白羊座";
            }
            break;
        case 4:
            if(i_day>=1 && i_day<=19){
                retStr=@"白羊座";
            }
            if(i_day>=20 && i_day<=31){
                retStr=@"金牛座";
            }
            break;
        case 5:
            if(i_day>=1 && i_day<=20){
                retStr=@"金牛座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"双子座";
            }
            break;
        case 6:
            if(i_day>=1 && i_day<=21){
                retStr=@"双子座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"巨蟹座";
            }
            break;
        case 7:
            if(i_day>=1 && i_day<=22){
                retStr=@"巨蟹座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"狮子座";
            }
            break;
        case 8:
            if(i_day>=1 && i_day<=22){
                retStr=@"狮子座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"处女座";
            }
            break;
        case 9:
            if(i_day>=1 && i_day<=22){
                retStr=@"处女座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"天秤座";
            }
            break;
        case 10:
            if(i_day>=1 && i_day<=23){
                retStr=@"天秤座";
            }
            if(i_day>=24 && i_day<=31){
                retStr=@"天蝎座";
            }
            break;
        case 11:
            if(i_day>=1 && i_day<=21){
                retStr=@"天蝎座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"射手座";
            }
            break;
        case 12:
            if(i_day>=1 && i_day<=21){
                retStr=@"射手座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"摩羯座";
            }
            break;
    }
    return retStr;
}

#pragma mark - 根据出生日期转换成星座码
- (NSString *)formatToConstellationCode {
    
    //计算星座
    NSString *retStr = @"1";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM"];
    int i_month = 0;
    NSString *theMonth = [dateFormat stringFromDate:self];
    if([[theMonth substringToIndex:0] isEqualToString:@"0"]){
        i_month = [[theMonth substringFromIndex:1] intValue];
    }else{
        i_month = [theMonth intValue];
    }
    
    [dateFormat setDateFormat:@"dd"];
    int i_day = 0;
    NSString *theDay = [dateFormat stringFromDate:self];
    if([[theDay substringToIndex:0] isEqualToString:@"0"]){
        i_day = [[theDay substringFromIndex:1] intValue];
    }else{
        i_day = [theDay intValue];
    }
    /*
     摩羯座 12月22日------1月19日
     水瓶座 1月20日-------2月18日
     双鱼座 2月19日-------3月20日
     白羊座 3月21日-------4月19日
     金牛座 4月20日-------5月20日
     双子座 5月21日-------6月21日
     巨蟹座 6月22日-------7月22日
     狮子座 7月23日-------8月22日
     处女座 8月23日-------9月22日
     天秤座 9月23日------10月23日
     天蝎座 10月24日-----11月21日
     射手座 11月22日-----12月21日
     */
    switch (i_month) {
        case 1:
            if(i_day>=20 && i_day<=31){
                retStr=@"2";
            }
            if(i_day>=1 && i_day<=19){
                retStr=@"1";
            }
            break;
        case 2:
            if(i_day>=1 && i_day<=18){
                retStr=@"2";
            }
            if(i_day>=19 && i_day<=31){
                retStr=@"3";
            }
            break;
        case 3:
            if(i_day>=1 && i_day<=20){
                retStr=@"3";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"4";
            }
            break;
        case 4:
            if(i_day>=1 && i_day<=19){
                retStr=@"4";
            }
            if(i_day>=20 && i_day<=31){
                retStr=@"5";
            }
            break;
        case 5:
            if(i_day>=1 && i_day<=20){
                retStr=@"5";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"6";
            }
            break;
        case 6:
            if(i_day>=1 && i_day<=21){
                retStr=@"6";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"7";
            }
            break;
        case 7:
            if(i_day>=1 && i_day<=22){
                retStr=@"7";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"8";
            }
            break;
        case 8:
            if(i_day>=1 && i_day<=22){
                retStr=@"8";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"9";
            }
            break;
        case 9:
            if(i_day>=1 && i_day<=22){
                retStr=@"9";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"10";
            }
            break;
        case 10:
            if(i_day>=1 && i_day<=23){
                retStr=@"10";
            }
            if(i_day>=24 && i_day<=31){
                retStr=@"11";
            }
            break;
        case 11:
            if(i_day>=1 && i_day<=21){
                retStr=@"11";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"12";
            }
            break;
        case 12:
            if(i_day>=1 && i_day<=21){
                retStr=@"12";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"1";
            }
            break;
    }
    return retStr;
}

#pragma mark -
#pragma mark - getter
//当前时间的小时四舍五入后的小时
- (NSInteger)nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [CURRENT_CALENDAR components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

//当前时间的小时
- (NSInteger)hour
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.hour;
}

//当前时间的分钟
- (NSInteger)minute
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.minute;
}

//当前时间的秒
- (NSInteger)seconds
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.second;
}

//当前时间的日
- (NSInteger)day
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.day;
}

//当前时间的月
- (NSInteger)month
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.month;
}

//当前时间的周（在一年之中）
- (NSInteger)week
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.weekOfYear;
}

//当前时间是周几
- (NSInteger)weekday
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.weekday;
}

//本月的第几周
- (NSInteger)nthWeekday
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.weekdayOrdinal;
}

//当前日期的年份
- (NSInteger)year
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.year;
}

@end
