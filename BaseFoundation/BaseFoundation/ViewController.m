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

@interface ViewController ()
@property(nonatomic, strong) ResponderViewA* viewA;
@property(nonatomic, strong) ResponderViewB* viewB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addTapGestureRecognizer:@selector(changeBackGroundColor) target:self];
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
    
    [self.viewA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(4);
        make.left.equalTo(self.view).offset(4);
        make.right.equalTo(self.view).offset(-4);
        make.height.equalTo(self.view).multipliedBy(0.49);
    }];
    
    [self.viewB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-4);
        make.left.equalTo(self.view).offset(4);
        make.right.equalTo(self.view).offset(-4);
        make.height.equalTo(self.view).multipliedBy(0.49);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
