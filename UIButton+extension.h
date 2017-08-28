//
//  UIButton+extension.h
//  cocoapodTest
//
//  Created by pptv on 2017/8/25.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (extension)

#pragma mark - 运行时给对象添加属性应用场景，扩大按钮的点击区域

- (void)setEnlargeEdge:(CGFloat) size;

- (void)setEnlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left;

@end
