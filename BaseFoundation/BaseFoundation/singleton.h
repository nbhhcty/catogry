//
//  singleton.h
//  BaseFoundation
//
//  Created by wsk on 2018/5/8.
//  Copyright © 2018年 wsk. All rights reserved.
//

#ifndef singleton_h
#define singleton_h

#define SingletonH(name) + (instancetype)shared##name;

#define SingletonM(name)    \
static id instance = nil;   \
+ (instancetype)shared##name  \
{   \
static dispatch_once_t onceToken;   \
dispatch_once(&onceToken, ^{    \
instance = [[[self class] alloc] init];  \
}); \
return instance;    \
}   \

#endif /* singleton_h */
