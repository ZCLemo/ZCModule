//
//  ProductOrderServiceProcotol.h
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ProductOrderServiceProcotol <NSObject>


/**
 产品下单页

 @param productId 产品Id
 @return 产品下单页
 */
- (UIViewController *)productOrderWithProductId:(NSString *)productId;

@end
