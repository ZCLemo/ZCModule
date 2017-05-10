//
//  ProductDetailTarget.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProductDetailTarget.h"
#import "MediatorProductDetailViewController.h"

@implementation ProductDetailTarget

- (UIViewController *)productDetailViewControllerWithParameters:(NSDictionary *)paramters
{
    MediatorProductDetailViewController *detailVC = [[MediatorProductDetailViewController alloc] init];
    detailVC.productId = paramters[@"productId"];
    detailVC.productName = paramters[@"productName"];
    return detailVC;
}

@end
