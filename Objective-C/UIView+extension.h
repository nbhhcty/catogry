//
//  UIView+extension.h
//  changDian
//
//  Created by wsk on 2017/9/3.
//  Copyright © 2017年 wsk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (extension)

- (void)removeAllSubviews;

#pragma mark - 添加手势
- (void)addTapGestureRecognizer:(nullable SEL) action target:(id)target;

- (void)addPanGestureRecognizer:(nullable SEL) action target:(id)target;

#pragma mark - layerEffects 设置圆角、边框、阴影
- (void)setCornerRadius:(CGFloat)radius;

- (void)setBorder:(UIColor *)color width:(CGFloat)width;

- (void)setShadow:(UIColor *)color opacity:(CGFloat)opacity offset:(CGSize)offset blurRadius:(CGFloat)blurRadius;

#pragma mark - frame 摘自：MGEasyFrame
/** @name Frame getters and setters */

/**
 * Get and set the view's size directly.
 */
@property (nonatomic, assign) CGSize size;

/**
 * Get and set the view's width directly.
 */
@property (nonatomic, assign) CGFloat width;

/**
 * Get and set the view's height directly.
 */
@property (nonatomic, assign) CGFloat height;

/**
 * Get and set the view's origin directly.
 */
@property (nonatomic, assign) CGPoint origin;

/**
 * Get and set the view's x coordinate directly.
 */
@property (nonatomic, assign) CGFloat x;

/**
 * Get and set the view's y coordinate directly.
 */
@property (nonatomic, assign) CGFloat y;

/**
 * Get and set the view's centerX coordinate directly.
 */
@property (nonatomic, assign) CGFloat centerX;

/**
 * Get and set the view's centerY coordinate directly.
 */
@property (nonatomic, assign) CGFloat centerY;


/** @name View edge getters and setters */

/**
 * Get and set the left edge's x coordinate of the view.
 */
@property (nonatomic, assign) CGFloat left;

/**
 * Get and set the top edge's y coordinate of the view.
 */
@property (nonatomic, assign) CGFloat top;

/**
 * Get and set the bottom edge's y coordinate of the view.
 */
@property (nonatomic, assign) CGFloat bottom;

/**
 * Get and set the right edge's x coordinate of the view.
 */
@property (nonatomic, assign) CGFloat right;

/** @name View corner getters and setters */

/**
 * Get and set the top left point of the view.
 */
@property (nonatomic, assign) CGPoint topLeft;

/**
 * Get and set the top right point of the view.
 */
@property (nonatomic, assign) CGPoint topRight;

/**
 * Get and set the bottom right point of the view.
 */
@property (nonatomic, assign) CGPoint bottomRight;

/**
 * Get and set the bottom left point of the view.
 */
@property (nonatomic, assign) CGPoint bottomLeft;

@end
