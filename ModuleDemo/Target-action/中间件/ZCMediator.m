//
//  ZCMediator.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ZCMediator.h"

@implementation ZCMediator

+ (ZCMediator *)sharedManger
{
    static ZCMediator *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZCMediator alloc] init];
    });
    return manager;
}

- (id)performTargetName:(NSString *)targetName actionName:(NSString *)actionName paramters:(NSDictionary *)paramtersDict
{
    if (!targetName || !actionName) {
        return nil;
    }
    
    Class class = NSClassFromString(targetName);
    id target = [[class alloc] init];
    if (!target) {
        return nil;
    }
    
    if (paramtersDict) {
        actionName = [actionName stringByAppendingString:@":"];
    }
    
    SEL action = NSSelectorFromString(actionName);
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:paramtersDict];
#pragma clang diagnostic pop
    }else{
        return nil;
    }
}

@end
