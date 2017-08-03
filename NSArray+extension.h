//
//  NSArray+extension.h
//  cocoapodTest
//
//  Created by pptv on 2017/8/3.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (extension)

#pragma mark - 判断是否为空
-(BOOL)isEmpty;

#pragma mark - 随机取值
-(id)randomObj;

#pragma mark - 洗牌
-(NSArray *)shuffledArray;

#pragma mark - 反转
-(NSArray *)reversedArray;

#pragma mark - 去重
-(NSArray *)uniqueObjArray;

#pragma mark - 排序
// 根据关键词 对array的内容进行排序，并返回排序后的array
- (NSArray *)sortedWithProperty:(NSString *)property ascending:(BOOL)ascending;

#pragma mark - 查找
// 二分法查找某个元素（全部范围）
-(NSUInteger)sortedArrayFindObjWith:(id)searchObj property:(NSString *)property;

// 二分法查找某个元素（指定范围）
-(NSUInteger)sortedArrayFindObjWith:(id)searchObj property:(NSString *)property searchRange:(NSRange)searchRange;

@end
