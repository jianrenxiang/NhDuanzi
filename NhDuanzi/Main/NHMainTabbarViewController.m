//
//  NHMainTabbarViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/27.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHMainTabbarViewController.h"
#import "NHBaseNavigationViewController.h"
#import "NHHomeViewController.h"
#import "NHDiscoverViewController.h"
#import "NHCheckViewController.h"
#import "NHMessageViewController.h"
#import "NHServiceListRequest.h"
#import "NHServiceListModel.h"
@interface NHMainTabbarViewController ()

@end

@implementation NHMainTabbarViewController

+(void)initialize{
    
    //设置不透明
    [[UITabBar appearance]setTranslucent:NO];
    //    设置背景颜色
    [UITabBar appearance].barTintColor=[UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    //拿到控制整个导航的外观
    UITabBarItem *item=[UITabBarItem appearance];
    item.titlePositionAdjustment=UIOffsetMake(0, 1.5);
    //普通状态
    NSMutableDictionary *normalAttrs=[NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    normalAttrs[NSForegroundColorAttributeName]=[UIColor colorWithRed:0.62f green:0.62f blue:0.62f alpha:1];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    //普通状态
    NSMutableDictionary *seletAttrs=[NSMutableDictionary dictionary];
    seletAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    seletAttrs[NSForegroundColorAttributeName]=[UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1];
    [item setTitleTextAttributes:seletAttrs forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllerWithClassname:[NHHomeViewController description] imagename:@"home" title:@"首页"];
    [self addChildViewControllerWithClassname:[NHDiscoverViewController description] imagename:@"Found" title:@"发现"];
    [self addChildViewControllerWithClassname:[NHCheckViewController description] imagename:@"audit" title:@"审核"];
    [self addChildViewControllerWithClassname:[NHMessageViewController description] imagename:@"newstab" title:@"消息"];
    NHServiceListRequest *request=[NHServiceListRequest nh_request];
    request.nh_url=kNHHomeServiceListAPI;
    [request nh_sendRequeseWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            NHBaseNavigationViewController *homeNav=(NHBaseNavigationViewController*)self.viewControllers.firstObject;
            NHHomeViewController *home=(NHHomeViewController*)homeNav.viewControllers.firstObject;
            home.models=[NHServiceListModel modelArrayWithDictArray:response];
        }
    }];

}

-(void)addChildViewControllerWithClassname:(NSString*)classname imagename:(NSString*)imagename title:(NSString*)title{
    //动态加载控制器
    UIViewController *vc=[[NSClassFromString(classname) alloc]init];
    NHBaseNavigationViewController *nav=[[NHBaseNavigationViewController alloc]initWithRootViewController:vc];
    nav.tabBarItem.title=title;
    nav.tabBarItem.image=[UIImage imageNamed:imagename];
    nav.tabBarItem.selectedImage=[[UIImage imageNamed:[imagename stringByAppendingString:@"_press"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
