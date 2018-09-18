//
//  NSString+Get.h
//  NeiQuanProject
//
//  Created by Mayer on 16/12/25.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Get)

#pragma mark - 截取前n位字符（带安全判断）
- (NSString *)subStringFrontLength:(NSInteger)length;
#pragma mark - 截取后n位字符（带安全判断）
- (NSString *)subStringAfterLength:(NSInteger)length;
#pragma mark - 拼音首字母
- (NSString *)getFirstLetter;
#pragma mark - 拼音首字母
- (NSString *)firstPinyin;
#pragma mark - 去除一个字符串的某个字串
- (NSString *)removeString:(NSString *)string;
#pragma mark - 将一个字符串后N位替换为某个字符串
- (NSString *)replaceLastLength:(NSInteger)length
                      newString:(NSString *)newString;
#pragma mark - 在固定的N个位置插入某个字符
- (NSString *)insetedSubString:(NSString *)subString
                  atIndexArray:(NSArray *)indexArray;
#pragma mark - 将一个字符串按照某个格式进行空格
- (NSString *)getStringLikeFormatString:(NSString *)formatString;
#pragma mark - 时间字符串（yyyy-MM-dd）转时间截(秒)
- (NSTimeInterval)convertToTimeSec;
#pragma mark - 时间字符串（yyyy-MM-dd）转时间截(毫秒)
- (NSTimeInterval)convertToTimeMillSec;
#pragma mark - 将对象转成json字符串
+ (NSString *)jsonStringWithObject:(id)obj;
#pragma mark - 数字格式化
//格式化浮点数
+ (NSString *)stringFormatFloat:(CGFloat)floatNum;
//格式化整数
+ (NSString *)stringFormatInteger:(NSInteger)integerNum;
#pragma mark - 拼接model数组中的字符串
+ (NSString *)stringWithModelArray:(NSArray *)array
                          modelKey:(NSString *)key
                          spaceStr:(NSString *)spaceStr;
#pragma mark - 格式化时间截（yyyy-MM-dd）
+ (NSString *)dateStringWithSec:(double)sec;
+ (NSString *)dateStringWithSec:(double)sec dateFormat:(NSString *)dateFormat;
#pragma mark - 格式化时间截(毫秒)（yyyy-MM-dd）
+ (NSString *)dateStringWithMillSec:(double)millSec;
+ (NSString *)dateStringWithMillSec:(double)millSec dateFormat:(NSString *)dateFormat;
#pragma mark - 根据出生日期转换成计算星座
+ (NSString *)getConstellationWithSec:(double)sec;

@end
