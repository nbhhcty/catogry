//
//  UIButton+extension.m
//  cocoapodTest
//
//  Created by pptv on 2017/8/25.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "UIButton+extension.h"

#import <objc/runtime.h>

@implementation UIButton (extension)

static char topNameKey;

static char rightNameKey;

static char bottomNameKey;

static char leftNameKey;

#pragma mark - 运行时给对象添加属性应用场景，扩大按钮的点击区域（testBtnCLickArea，需要添加第三方库Masonry、ReactiveCocoa）
//-(void)testBtnCLickArea
//{
//    UIView* btnRootView = [UIView new];
//    [self.view addSubview:btnRootView];
//    btnRootView.backgroundColor = [UIColor blueColor];
//    [btnRootView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(200, 200));
//    }];
//
//    最大点击区域为父视图的size，如果设置的区域大于父视图的size，将无效
//    UIButton* clickBtn = [UIButton new];
//    [btnRootView addSubview:clickBtn];
//    clickBtn.backgroundColor = [UIColor yellowColor];
//    [clickBtn setEnlargeEdgeWithTop:0 right:0 bottom:100 left:100];
//    [clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(btnRootView);
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//    }];
//    [[clickBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        btnRootView.hidden = YES;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            btnRootView.hidden = NO;
//        });
//    }];
//}

- (void)setEnlargeEdge:(CGFloat) size
{
    objc_setAssociatedObject(self,
                             &topNameKey,
                             [NSNumber numberWithFloat:size],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self,
                             &rightNameKey,
                             [NSNumber numberWithFloat:size],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self,
                             &bottomNameKey,
                             [NSNumber numberWithFloat:size],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self,
                             &leftNameKey,
                             [NSNumber numberWithFloat:size],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left
{
    objc_setAssociatedObject(self,
                             &topNameKey,
                             [NSNumber numberWithFloat:top],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self,
                             &rightNameKey,
                             [NSNumber numberWithFloat:right],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self,
                             &bottomNameKey,
                             [NSNumber numberWithFloat:bottom],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self,
                             &leftNameKey,
                             [NSNumber numberWithFloat:left],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          
                          self.bounds.origin.y - topEdge.floatValue,
                          
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else {
        return self.bounds;
    }
}

- (UIView*)hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];
    
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    
    return CGRectContainsPoint(rect, point) ? self : nil;
}










@end
