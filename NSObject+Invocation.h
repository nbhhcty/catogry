//
//  NSObject+Invocation.h
//  cocoapodTest
//
//  Created by pptv on 2017/8/21.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 
 提示：多用GCD，少用performSelector系列方法
 参考：http://zhangbuhuai.com/using-gcd-part-2/
      
      http://www.jianshu.com/p/672c0d4f435a
 
 使用技巧：代替多个if-else（或者switch）建议使用方法二
 方法一：传递多个参数
     -(void)testPerformSelector
     {
         SEL selector1 = @selector(testPerformSelector1:);
         
         SEL selector2 = @selector(testPerformSelector2:);
         
         NSMutableDictionary* dict = [NSMutableDictionary dictionary];
         
         dict[@"1"] = NSStringFromSelector(selector1);
         dict[@"2"] = NSStringFromSelector(selector2);
         
         [self performSelector:NSSelectorFromString(dict[@"1"]) withObject:@"牛逼吗"];
     }
     
     -(void)testPerformSelector1:(NSString*)infor
     {
         NSLog(@"infor = %@", infor);
     }
     
     -(void)testPerformSelector2:(NSString*)infor
     {
         NSLog(@"infor = %@", infor);
     }
 
     .
 
     .
 
     .
 
     .
 
 方法二：直接使用运行时objc_msgSend
 
     NSString *str = @"字符串objc_msgSend";
     NSNumber *num = @20;
     NSArray *arr = @[@"数组值1", @"数组值2"];
     SEL sel = NSSelectorFromString(@"ObjcMsgSendWithString:withNum:withArray:");
     
     ((void (*) (id, SEL, NSString *, NSNumber *, NSArray *)) objc_msgSend) (self, sel, str, num, arr);
     
     - (void)ObjcMsgSendWithString:(NSString *)string withNum:(NSNumber *)number withArray:(NSArray *)array {
         NSLog(@"%@, %@, %@", string, number, array[0]);
     }
 
 */
@interface NSObject (Invocation)

- (id)performSelector:(SEL)selector withObjects:(NSArray *)objcet;

@end
