//
//  ProcotolManager.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/9.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProcotolManager.h"

@interface ProcotolManager ()

@property (nonatomic,strong)NSMutableDictionary *serviceDataSource;

@end

@implementation ProcotolManager

+ (ProcotolManager *)sharedManger
{
    static ProcotolManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.serviceDataSource = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)registServiceProvide:(id)provide forProcotol:(Protocol *)procotol
{
    if (!provide || !procotol) {
        return;
    }
    NSString *procotolName = NSStringFromProtocol(procotol);
    [self.serviceDataSource setObject:provide forKey:procotolName];
}

- (id)serviceProvideForProcotol:(Protocol *)procotol
{
    if (!procotol) {
        return nil;
    }
    return [self.serviceDataSource objectForKey:NSStringFromProtocol(procotol)];
}

@end
