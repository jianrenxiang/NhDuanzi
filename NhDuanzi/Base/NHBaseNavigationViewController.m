//
//  NHBaseNavigationViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/27.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseNavigationViewController.h"

@interface NHBaseNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation NHBaseNavigationViewController

+(void)initialize{
    //设置为不透明
    [[UINavigationBar appearance]setTranslucent:NO];
//    、、设置导航栏的背景颜色
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0.86f green:0.85f blue:0.80f alpha:1]];
    NSMutableDictionary *color=[NSMutableDictionary dictionary];
    color[NSFontAttributeName]=kFont(17.0f);
    color[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];;
    [[UINavigationBar appearance] setTitleTextAttributes:color];
    // 拿到整个导航控制器的外观
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    // 设置字典的字体大小
    NSMutableDictionary * atts = [NSMutableDictionary dictionary];
    
    atts[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    atts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    // 将字典给item
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    
    [[UINavigationBar appearance]setShadowImage:[UIImage new]];
    [[UINavigationBar appearance]setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
        if (self.viewControllers.count>0) {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
            [btn setImage:[UIImage imageNamed:@"back_neihan"] forState:UIControlStateNormal];
            btn.imageEdgeInsets=UIEdgeInsetsMake(0, -18, 0, 0);
            btn.tintColor=[UIColor colorWithRed:0.42f green:0.33f blue:0.27 alpha:1.0f];
            UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
            [btn addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
            viewController.navigationItem.leftBarButtonItem=leftItem;
        }else{
//            viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem ]
        }
    [super pushViewController:viewController animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
