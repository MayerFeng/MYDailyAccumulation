//
//  NSString+Encrypt.m
//  NeiQuanProject
//
//  Created by Mayer on 16/1/12.
//  Copyright © 2016年 河南维创盈通科技有限公司. All rights reserved.
//

#import "NSString+Encrypt.h"    //加密
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (Encrypt)

#pragma mark - md5加密
- (NSString *)md5
{
    return [NSString md5String:self];
}

#pragma mark - md5加密（类方法）
+ (NSString *)md5String:(NSString *)str;
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (uint32_t)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
            ];
}

#pragma mark - HMAC-SHA1加密
/**
 *  HMAC-SHA1加密
 *
 *  @param text 加密内容
 *  @param key  秘钥
 *  @return 加密后的字符串
 */
+ (NSString *)hmacSha1:(NSString *)text key:(NSString *)key {
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [text cStringUsingEncoding:NSUTF8StringEncoding];
    uint8_t cHMAC[CC_SHA1_DIGEST_LENGTH];
    //SHA1哈希算法
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSString *hash;
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", cHMAC[i]];
    hash = output;
    
    return hash;
}

#pragma mark - DES加密
/**
 *  文本数据进行DES加密
 *  @param text 要加密的文本
 *  @param key  秘钥
 */
+ (NSString *)desEncrypt:(NSString *)text key:(NSString *)key
{
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeDES,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        return [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    }
    
    free(buffer);
    return nil;
}

#pragma mark - DES解密
/**
 *  文本数据进行DES解密
 *  @param text 要解密的文本
 *  @param key  秘钥
 */
+ (NSString *)desDecrypt:(NSString *)text key:(NSString *)key
{
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeDES,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        return [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    }
    
    free(buffer);
    return nil;
}

@end
