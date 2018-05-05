//
//  NSDictionary+extension.m
//  cocoapodTest
//
//  Created by pptv on 2017/8/3.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "NSDictionary+extension.h"

@implementation NSDictionary (extension)

-(BOOL)isEmpty
{
    if (self != nil &&
        [self isKindOfClass:[NSDictionary class]] &&
        ![self isKindOfClass:[NSNull class]] &&
        self.count > 0)
    {
        return NO;
    }
    return YES;
}

@end
