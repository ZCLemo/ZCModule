//
//  ProductDetailServiceProdive.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/9.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProductDetailServiceProvide.h"
#import "ProductDetailServiceProcotol.h"
#import "ProcotolManager.h"
#import "ProcotolProductDetailViewController.h"

@interface ProductDetailServiceProvide ()<ProductDetailServiceProcotol>

@end

@implementation ProductDetailServiceProvide

//load 方法会在加载类的时候就被调用，也就是 ios 应用启动的时候，就会加载所有的类，就会调用每个类的 + load 方法
+ (void)load
{
    [[ProcotolManager sharedManger] registServiceProvide:[[self alloc] init] forProcotol:@protocol(ProductDetailServiceProcotol)];
}

#pragma mark - ProductDetailServiceProcotol

- (UIViewController *)productDetailViewControllerWithProductId:(NSString *)productId
{
    ProcotolProductDetailViewController *detailVC = [[ProcotolProductDetailViewController alloc] init];
    detailVC.productId = productId;
    return detailVC;
}

@end
