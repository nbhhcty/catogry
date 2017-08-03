//
//  NSArray+extension.m
//  cocoapodTest
//
//  Created by pptv on 2017/8/3.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "NSArray+extension.h"

#define MD_CHECK_EMPTY      if ( [self isEmpty] ) {     \
                                return nil;             \
                            }

@implementation NSArray (extension)

-(BOOL)isEmpty
{
    if (self != nil &&
        [self isKindOfClass:[NSArray class]] &&
        ![self isKindOfClass:[NSNull class]] &&
        self.count > 0)
    {
        return NO;
    }
    return YES;
}

-(id)randomObj
{
    MD_CHECK_EMPTY
    
    int index = arc4random() % [self count];
    id object = [self objectAtIndex:index];
    return object;
}

-(NSArray *)shuffledArray
{
    MD_CHECK_EMPTY
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSMutableArray *copy = [self mutableCopy];
    while ([copy count] > 0)
    {
        int index = arc4random() % [copy count];
        id objectToMove = [copy objectAtIndex:index];
        [array addObject:objectToMove];
        [copy removeObjectAtIndex:index];
    }
    return array;
}

-(NSArray *)reversedArray
{
    MD_CHECK_EMPTY
    
    return [[self reverseObjectEnumerator] allObjects];
}

-(NSArray *)uniqueObjArray
{
    MD_CHECK_EMPTY
    
    NSSet* set = [NSSet setWithArray:self];
    return [[NSArray alloc]initWithArray:[set allObjects]];
}

-(NSArray *)sortedWithProperty:(NSString *)property ascending:(BOOL)ascending {
    MD_CHECK_EMPTY
#pragma mark - 返回新的数组，原数组不变

#pragma mark - 方法一：使用comparator
    NSArray *comparatorSortedArray = [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if (ascending) {
            return [[obj1 valueForKey:property] compare:[obj2 valueForKey:property]];
        }
        return [[obj2 valueForKey:property] compare:[obj1 valueForKey:property]];
    }];
    return comparatorSortedArray;

#if 0
#pragma mark - 方法二：使用descriptors
    NSSortDescriptor*sorter=[[NSSortDescriptor alloc]initWithKey:property ascending:ascending];
    NSMutableArray *sortDescriptors=[[NSMutableArray alloc]initWithObjects:&sorter count:1];
    NSArray *sortArray=[self sortedArrayUsingDescriptors:sortDescriptors];
    return sortArray;
#endif
    
}








@end
