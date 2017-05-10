//
//  ViewController.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/9.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ViewController.h"
#import "ProcotolManager.h"
#import "ProductDetailServiceProcotol.h"
#import "ZCMediator+ProductDetail.h"
#import "MGJRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mediatorSkip:(id)sender {
    UIViewController *detailVC = [[ZCMediator sharedManger] productDetailViewControllerWithProductName:@"营养快线" productId:@"test"];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (IBAction)urlSkip:(id)sender {
    
    UIViewController *detailVC = [MGJRouter objectForURL:@"leadbank://product_detail" withUserInfo:@{@"productName":@"营养快线"}];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

- (IBAction)procotolSkip:(id)sender {
    
    id<ProductDetailServiceProcotol> procotolProvide = [[ProcotolManager sharedManger] serviceProvideForProcotol:@protocol(ProductDetailServiceProcotol)];
    UIViewController *vc = [procotolProvide productDetailViewControllerWithProductId:@"test"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
