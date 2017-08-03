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
    
// 方法一：开辟新的内存空间
#if 0
    NSArray *originalArr = @[@1, @2, @3, @1, @3];
    NSMutableArray *resultArrM = [NSMutableArray array];
    
    for (NSString *item in originalArr) {
        if (![resultArrM containsObject:item]) {
            [resultArrM addObject:item];
        }
    }
    NSLog(@"result : %@", resultArrM);
#endif
    
    // 方法二：利用NSDictionary的AllKeys（AllValues）方法。利用AllKeys或者AllValues取得字典的所有键或值，这些键或值都是去重的
#if 0
    NSArray *originalArr = @[@1, @2, @3, @1, @3];
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    for (NSNumber *n in originalArr) {
        [dict setObject:n forKey:n];
    }
    NSLog(@"%@",[dictM allValues]);
#endif
    
    // 方法三：通过valueForKeyPath, 去重只需一行代码
#if 0
    NSArray *originalArr = @[@1, @2, @3, @1, @3];
    NSArray *result = [originalArr valueForKeyPath:@"@distinctUnionOfObjects.self"];
#endif

    // 方法四：利用NSSet特性, 放入集合自动去重。NSSet的特性: 确定性、无序性、互异性。这种方法更快，利用NSSet不会添加重复元素的特性。
    NSSet* set = [NSSet setWithArray:self];
    return [[NSArray alloc]initWithArray:[set allObjects]];
}

-(NSArray *)sortedWithProperty:(NSString *)property ascending:(BOOL)ascending {
    MD_CHECK_EMPTY
// 返回新的数组，原数组不变

// 方法一：使用comparator
    NSArray *comparatorSortedArray = [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if (ascending) {
            return [[obj1 valueForKey:property] compare:[obj2 valueForKey:property]];
        }
        return [[obj2 valueForKey:property] compare:[obj1 valueForKey:property]];
    }];
    return comparatorSortedArray;

#if 0
// 方法二：使用descriptors
    NSSortDescriptor*sorter=[[NSSortDescriptor alloc]initWithKey:property ascending:ascending];
    NSMutableArray *sortDescriptors=[[NSMutableArray alloc]initWithObjects:&sorter count:1];
    NSArray *sortArray=[self sortedArrayUsingDescriptors:sortDescriptors];
    return sortArray;
#endif
    
}

-(NSUInteger)sortedArrayFindObjWith:(id)searchObj property:(NSString *)property
{
    return [self sortedArrayFindObjWith:searchObj property:property searchRange:NSMakeRange(0, self.count)];
}

-(NSUInteger)sortedArrayFindObjWith:(id)searchObj property:(NSString *)property searchRange:(NSRange)searchRange
{
    NSUInteger findIndex = [self indexOfObject:searchObj
                                 inSortedRange:searchRange
                                       options:NSBinarySearchingFirstEqual
                               usingComparator:^(id obj1, id obj2)
                            {
                                return [[obj1 valueForKey:property] compare:[obj2 valueForKey:property]];
                            }];
    return findIndex;
}





@end
