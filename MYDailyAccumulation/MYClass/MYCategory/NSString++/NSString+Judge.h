//
//  NSString+Judge.h
//  NeiQuanProject
//
//  Created by Mayer on 16/12/25.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Judge)

#pragma mark - 是否是正确的手机号格式？
- (BOOL)isMobileNumber;
#pragma mark - 是否是正确的电话号码（手机+固话)？
- (BOOL)isTelNumber;
#pragma mark - 是否是正确的邮箱格式?
- (BOOL)isEmailAddress;
#pragma mark - 是否是正确的身份证号格式?
- (BOOL)isPersonIDCardNumber;
#pragma mark - 是否是正确格式的验证码?
- (BOOL)isVerificationCode;
#pragma mark - 是否是用户密码6-18位数字和字母组合?
- (BOOL)isPassword;
#pragma mark - 是否是正则匹配用户姓名,20位的中文或英文？
- (BOOL)isUserName;
#pragma mark - 是否是正确的昵称格式？
- (BOOL)isNickName;
#pragma mark - 是否是正确的URL字符串？
- (BOOL)isURL;
#pragma mark - 是否是正确格式的银行卡号？
- (BOOL)isBankNumber;
#pragma mark - 会否包含空格或换行符？
- (BOOL)isWhitespaceAndNewlines;
#pragma mark - 是否包含中文？
- (BOOL)isChinese;
#pragma mark - 字符串是否为空
+ (BOOL)isEmpty:(NSString *)string;

@end
