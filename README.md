# ZCModule
组件化的三种方案

## 前言：
前段时间由于公司业务的需要，要求对项目进行组件化的拆分，减少各个模块之间耦合。希望达到的效果是各个组件能单独的打私有pod，方便在其它工程里引用。由于项目现在比较庞大，目前只做了本地拆分。期间学习了很多有关组件化方面的知识，现在做个总结，后面会有有三种方案相关的资料链接。先上我自己对于三种方案总结的一个demo,[github地址](https://github.com/ZCLemo/ZCModule)

## 概述：
组件化是为了各个模块不进行直接的相互引用，降低耦合度，那么如果组件A想调用组件B的时候要怎么办呢，其实原理上都是通过中间件来调用，而不需要模块间相互引用。 我们所看到的组件化方案，大体总结来说有三种：
- 1.procotol方案
- 2.URL路由方案
- 3.target-action方案
### 一、procotol协议注册方案
关于procotol协议注册方案见到别人分享比较少，有次查资料的时候看到了，就研究了一下。
在demo中ProcotolManager作为中间件：

``` bash
- (void)registServiceProvide:(id)provide forProcotol:(Protocol *)procotol;

- (id)serviceProvideForProcotol:(Protocol *)procotol;
```

所有组件对外提供的procotol和组件提供的服务由中间件统一管理，每个组件提供的procotol和服务是一一对应的。

在ProductDetailServiceProvide中:load方法会应用启动的时候调用，就会在ProcotolManager进行注册。ProductDetailServiceProvide遵守了ProductDetailServiceProcotol协议，所以对能外提供productDetailViewControllerWithProductId服务。

``` bash
+ (void)load
{
[[ProcotolManager sharedManger] registServiceProvide:[[self alloc] init] forProcotol:@protocol(ProductDetailServiceProcotol)];
}

- (UIViewController *)productDetailViewControllerWithProductId:(NSString *)productId
{
ProcotolProductDetailViewController *detailVC = [[ProcotolProductDetailViewController alloc] init];
detailVC.productId = productId;
return detailVC;
}
```
所以在首页中，通过ProcotolManager取出ProductDetailServiceProcotol对应的服务提供者ProductDetailServiceProvide，就可以调用产品详情中所提供的服务，而不需要进行直接引用。

### 二、URL路由方案

URL路由方案参考的是蘑菇街MGJRouter方案
[蘑菇街 App 的组件化之路](https://github.com/ZCLemo/ZCModule)，讲的比较详细。

### 三、target-action方案
target-action方案是在学习CTMediator的基础上进行的，ZCMediator作为中间件，里面的实现也比较简单。

``` bash
- (id)performTargetName:(NSString *)targetName actionName:(NSString *)actionName paramters:(NSDictionary *)paramtersDict;
```
执行时查找对应的target有没有对外暴露的服务，如果有则执行。
主要的还是每一个组件暴露出的category，是对中间件的一个扩展，调用每个组件对应的category方法，然后在通过中间件调用对外暴露的服务。

``` bash
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
```
我们项目里使用的就是target-action方案。下次再写一篇几种方案的比较吧。

参考链接：

[iOS组件化方案](http://www.jianshu.com/p/2cb4cc8d216e)

[iOS应用架构谈 组件化方案](https://casatwy.com/iOS-Modulization.html)

[蘑菇街 App 的组件化之路](https://github.com/ZCLemo/ZCModule)
