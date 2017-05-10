//
//  ProductOrderServicrProvide.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProductOrderServicrProvide.h"
#import "ProcotolManager.h"
#import "ProductOrderServiceProcotol.h"
#import "ProcotolProductOrderViewController.h"

@interface ProductOrderServicrProvide ()<ProductOrderServiceProcotol>

@end

@implementation ProductOrderServicrProvide

+ (void)load
{
    [[ProcotolManager sharedManger] registServiceProvide:[[self alloc] init] forProcotol:@protocol(ProductOrderServiceProcotol)];
}

- (UIViewController *)productOrderWithProductId:(NSString *)productId
{
    ProcotolProductOrderViewController *orderVC = [[ProcotolProductOrderViewController alloc] init];
    orderVC.productId = productId;
    return orderVC;
}

@end
