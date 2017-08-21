//
//  NSObject+Invocation.m
//  cocoapodTest
//
//  Created by pptv on 2017/8/21.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "NSObject+Invocation.h"

@implementation NSObject (Invocation)

- (id)performSelector:(SEL)selector withObjects:(NSArray *)objcet
{
    NSMethodSignature * signature = [[self class] instanceMethodSignatureForSelector:selector];
    
    //判读是否有这个方法
    if (signature==nil)
    {
        NSString *info =
        [NSString stringWithFormat:@"%@方法找不到", NSStringFromSelector(selector)];
        [NSException raise:@"方法调用异常" format:info,nil];
        return nil;
    }
    
    NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.selector = selector;
    invocation.target = self;
    
    //arry.count 当输入的数组多余方法参数可能会越界，signature.numberOfArguments-2 为方法的参数个数
    NSInteger count = MIN(signature.numberOfArguments-2, objcet.count);
    
    for (int i = 0; i<count; i++)
    {
        id obj = objcet[i];
        [invocation setArgument:&(obj) atIndex:(i+2)];
    }
    
    [invocation invoke];
    
    //获取返回值
    id returnValue = nil;
    
    if (signature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}
















@end
