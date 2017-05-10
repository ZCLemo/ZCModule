//
//  ProductDetailTarget.h
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProductDetailTarget : NSObject


/**
 返回产品详情页

 @param paramters 传递参数
 @return 产品详情页
 */
- (UIViewController *)productDetailViewControllerWithParameters:(NSDictionary *)paramters;

@end
