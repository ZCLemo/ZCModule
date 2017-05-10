//
//  ZCMediator+ProductDetail.h
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ZCMediator.h"
#import <UIKit/UIKit.h>

@interface ZCMediator (ProductDetail)

- (UIViewController *)productDetailViewControllerWithProductName:(NSString *)productName productId:(NSString *)productId;

@end
