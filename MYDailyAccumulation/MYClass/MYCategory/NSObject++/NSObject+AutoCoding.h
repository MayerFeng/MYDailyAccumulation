//
//  NSObject+AutoCoding.h
//  NeiQuanProject
//
//  Created by Mayer on 16/11/7.
//  Copyright © 2017年 内圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (AutoCoding)

//返回所有的属性，如果重写，不要调用super
+ (NSDictionary<NSString *, Class> *)codableProperties;

- (void)setWithCoder:(NSCoder *)aDecoder;

@property (nonatomic, readonly) NSDictionary<NSString *, Class> *codableProperties;

@property (nonatomic, readonly) NSDictionary<NSString *, id> *dictionaryRepresentation;

//从本地取
+ (instancetype)objectWithContentsOfFile:(NSString *)path;
//写入本地
- (BOOL)writeToFile:(NSString *)filePath atomically:(BOOL)useAuxiliaryFile;

@end
