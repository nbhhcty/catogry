//
//  ViewController.m
//  BaseFoundation
//
//  Created by wsk on 2018/5/5.
//  Copyright © 2018年 wsk. All rights reserved.
//

#import "ViewController.h"
#import "UIView+extension.h"
#import "BaseFoundation-Swift.h"
#import "Masonry.h"
#import "singletonClass1.h"


@interface ViewController ()
@property(nonatomic, strong) ResponderViewA* viewA;
@property(nonatomic, strong) ResponderViewB* viewB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addTapGestureRecognizer:@selector(changeBackGroundColor) target:self];
    NSLog(@"singletonClass1.sharedsingletonClass1 = %@", singletonClass1.sharedsingletonClass1);
    NSLog(@"[[singletonClass1 alloc]init] = %@", [[singletonClass1 alloc]init]);
    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    imageView.image = [UIImage imageNamed:@"yo_shotcut_appicon"];
//    //开始对imageView进行画图
//    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
//    //使用贝塞尔曲线画出一个圆形图
//    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
//    [imageView drawRect:imageView.bounds];
//    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//    //结束画图
//    UIGraphicsEndImageContext();
//    [self.view addSubview:imageView];
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(100,100,100,100)];
    imageView.image=[UIImage imageNamed:@"yo_shotcut_appicon"];
    
    UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                                 byRoundingCorners:UIRectCornerAllCorners
                                                       cornerRadii:imageView.bounds.size];
    CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame=imageView.bounds;
    
    //设置图形样子
    maskLayer.path=maskPath.CGPath;
    imageView.layer.mask=maskLayer;
    [self.view addSubview:imageView];
}

- (void)uiResponderTest {
    
}

- (void)swiftExtensionTest {
    StringExtensionTest* tester = [StringExtensionTest new];
    NSLog(@"appVersion = %@", tester);
}

- (void)changeBackGroundColor {
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewATapAction {
    NSLog(@"viewATapAction");
}

-(ResponderViewA *)viewA {
    if (!_viewA) {
        _viewA = [ResponderViewA new];
        _viewA.backgroundColor = [UIColor blueColor];
        [_viewA addTapGestureRecognizer:@selector(viewATapAction) target:self];
        [self.view addSubview:_viewA];
    }
    return _viewA;
}

- (void)viewBTapAction {
    NSLog(@"viewBTapAction");
}

-(ResponderViewB *)viewB {
    if (!_viewB) {
        _viewB = [ResponderViewB new];
        _viewB.backgroundColor = [UIColor brownColor];
        [_viewB addTapGestureRecognizer:@selector(viewBTapAction) target:self];
        [self.view addSubview:_viewB];
    }
    return _viewB;
}

- (void)viewA_1TapAction {
    NSLog(@"viewA_1TapAction");
}

-(void)updateViewConstraints {
    [super updateViewConstraints];
    
//    [self.viewA mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(4);
//        make.left.equalTo(self.view).offset(4);
//        make.right.equalTo(self.view).offset(-4);
//        make.height.equalTo(self.view).multipliedBy(0.4);
//    }];
//    
//    [self.viewB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.view).offset(-4);
//        make.left.equalTo(self.view).offset(4);
//        make.right.equalTo(self.view).offset(-4);
//        make.height.equalTo(self.view).multipliedBy(0.4);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
