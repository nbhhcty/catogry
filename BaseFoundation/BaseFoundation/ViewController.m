//
//  ViewController.m
//  BaseFoundation
//
//  Created by wsk on 2018/5/5.
//  Copyright © 2018年 wsk. All rights reserved.
//

#import "ViewController.h"
#import "UIView+extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addTapGestureRecognizer:@selector(changeBackGroundColor) target:self];
}

- (void)changeBackGroundColor {
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
