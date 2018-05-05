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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addTapGestureRecognizer:@selector(changeBackGroundColor) target:self];
    
    StringExtensionTest* tester = [StringExtensionTest new];
    
    NSLog(@"appVersion = %@", tester);
}

- (void)changeBackGroundColor {
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
