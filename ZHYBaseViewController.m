//
//  ZHYBaseViewController.m
//  ZHYFramework
//
//  Created by apple on 16/5/28.
//  Copyright © 2016年 ZhouYuan. All rights reserved.
//

#import "ZHYBaseViewController.h"

@implementation ZHYBaseViewController

#pragma mark - life cycle

- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xe9e9e9);
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

@end
