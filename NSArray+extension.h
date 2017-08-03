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

#pragma mark - 返回重新洗牌后的数组
-(NSArray *)shuffledArray;

#pragma mark - 数组反转
-(NSArray *)reversedArray;

#pragma mark - 数组去重
-(NSArray *)uniqueObjArray;

#pragma mark - 根据关键词 对array的内容进行排序，并返回排序后的array
- (NSArray *)sortedWithProperty:(NSString *)property ascending:(BOOL)ascending;

@end
