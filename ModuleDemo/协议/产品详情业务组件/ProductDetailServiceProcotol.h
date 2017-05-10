//
//  ProductProcotolService.h
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/9.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ProductDetailServiceProcotol <NSObject>

/**
 产品详情页

 @param productId 产品Id
 @return 产品详情页
 */
- (UIViewController *)productDetailViewControllerWithProductId:(NSString *)productId;

@end
