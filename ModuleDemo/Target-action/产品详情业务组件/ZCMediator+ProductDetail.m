//
//  ZCMediator+ProductDetail.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ZCMediator+ProductDetail.h"

//target
NSString *const MP_PRODUCT_DETAIL_TARGET = @"ProductDetailTarget";

//方法名
NSString *const MP_PRODUCT_DETAIL = @"productDetailViewControllerWithParameters";


@implementation ZCMediator (ProductDetail)

- (UIViewController *)productDetailViewControllerWithProductName:(NSString *)productName productId:(NSString *)productId
{
    if (!productName || !productId) {
        return nil;
    }
    return [self performTargetName:MP_PRODUCT_DETAIL_TARGET actionName:MP_PRODUCT_DETAIL paramters:@{@"productName":productName,@"productId":productId}];
}


@end
