//
//  ProcotolProductOrderViewController.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProcotolProductOrderViewController.h"

@interface ProcotolProductOrderViewController ()

@property (nonatomic,strong)UIButton *orderBtn;

@end

@implementation ProcotolProductOrderViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.orderBtn];
}

#pragma mark - Target Methods

- (void)orderBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Setter & Getter

- (UIButton *)orderBtn
{
    if (!_orderBtn) {
        _orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _orderBtn.bounds = CGRectMake(0, 0, 100, 100);
        _orderBtn.center = self.view.center;
        [_orderBtn setTitle:@"立即下单" forState:UIControlStateNormal];
        _orderBtn.backgroundColor = [UIColor redColor];
        [_orderBtn addTarget:self action:@selector(orderBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _orderBtn;
}

@end
