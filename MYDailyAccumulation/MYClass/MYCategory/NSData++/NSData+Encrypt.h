//
//  NSData+Encrypt.h
//  MeiYiQuan
//
//  Created by Mayer on 17/1/16.
//  Copyright © 2017年 Mayer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encrypt)

#pragma mark - DES加密
/**
 *  数据进行DES加密
 *  @param data 要加密的数据
 *  @param key  秘钥
 */
+ (NSData *)desEncrypt:(NSData *)data key:(NSString *)key;

#pragma mark - DES解密
/**
 *  数据进行DES解密
 *  @param data 要加密的数据
 *  @param key  秘钥
 */
+ (NSData *)desDecrypt:(NSData *)data key:(NSString *)key;


@end
