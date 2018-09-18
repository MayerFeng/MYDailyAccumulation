//
//  NSString+Encrypt.h
//  NeiQuanProject
//
//  Created by Mayer on 16/1/12.
//  Copyright © 2016年 河南维创盈通科技有限公司. All rights reserved.
//

/*
 MD5,SHA-1,SHA-224,SHA-256,SHA-384,SHA-512，以及它们对应的HMAC算法，都属于散列算法，又叫摘要算法，单向运算，不可逆，所以没法解密。但是可以通过暴力方式破解(按顺序产生字符串一个个试)，当然会花非常长的时间，而且这个试出来的结果也不一定是原结果，因为的确存在多个源数据能计算出相同散列结果的情况。
*/

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)

#pragma mark - md5加密
- (NSString *)md5;
#pragma mark - md5加密（类方法）
+ (NSString *)md5String:(NSString *)str;

#pragma mark - HMAC-SHA1加密
/**
 *  HMAC-SHA1加密
 *
 *  @param text 加密内容
 *  @param key  秘钥
 *  @return 加密后的字符串
 */
+ (NSString *)hmacSha1:(NSString *)text key:(NSString *)key;

#pragma mark - DES加密
/**
 *  文本数据进行DES加密
 *  @param text 要加密的文本
 *  @param key  秘钥
 */
+ (NSString *)desEncrypt:(NSString *)text key:(NSString *)key;

#pragma mark - DES解密
/**
 *  文本数据进行DES解密
 *  @param text 要解密的文本
 *  @param key  秘钥
 */
+ (NSString *)desDecrypt:(NSString *)text key:(NSString *)key;

@end
