//
//  ZCMediator.h
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCMediator : NSObject

+ (ZCMediator *)sharedManger;

/**
 本地组件调用

 @param targetName target
 @param actionName 方法名
 @param paramtersDict 参数字典
 @return id
 */
- (id)performTargetName:(NSString *)targetName actionName:(NSString *)actionName paramters:(NSDictionary *)paramtersDict;

@end
