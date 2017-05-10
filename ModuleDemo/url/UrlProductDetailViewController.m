//
//  UrlProductDetailViewController.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "UrlProductDetailViewController.h"
#import "MGJRouter.h"

@interface UrlProductDetailViewController ()

@end

@implementation UrlProductDetailViewController

+ (void)load
{
    [MGJRouter registerURLPattern:@"leadbank://product_detail" toObjectHandler:^(NSDictionary *routerParameters) {
        NSDictionary *parameter = [routerParameters objectForKey:MGJRouterParameterUserInfo];
        UrlProductDetailViewController *detailVC = [[UrlProductDetailViewController alloc] init];
        detailVC.productName = parameter[@"productName"];
        return detailVC;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.productName;
}


@end
