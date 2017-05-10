//
//  MediatorProductDetailViewController.m
//  ModuleDemo
//
//  Created by 赵琛 on 2017/5/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "MediatorProductDetailViewController.h"

@interface MediatorProductDetailViewController ()

@property (nonatomic,strong)UILabel *descLb;

@property (nonatomic,strong)UILabel *priceLb;


@end

@implementation MediatorProductDetailViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.productName;
    [self.view addSubview:self.descLb];
    [self.view addSubview:self.priceLb];
    
    //模拟网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.productId isEqualToString:@"test"]) {
            self.descLb.text = @"营养快线农村人喝不起啊，太贵了营养快线农村人喝不起啊，太贵了营养快线农村人喝不起啊，太贵了";
            self.priceLb.text = @"100元";
        }
    });
    
}

#pragma mark - Setter & Getter

- (UILabel *)descLb
{
    if (!_descLb) {
        _descLb = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width - 40, 100)];
        _descLb.numberOfLines = 0;
        _descLb.textColor = [UIColor redColor];
        
    }
    return _descLb;
}

- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, [UIScreen mainScreen].bounds.size.width - 40, 20)];
        _priceLb.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLb;
}


@end
