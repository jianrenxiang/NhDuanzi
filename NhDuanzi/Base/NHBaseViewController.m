//
//  NHBaseViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/27.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseViewController.h"
#import "NSNotificationCenter+Addition.h"
#import "NHCustomNoNetworkEmptyView.h"
#import "NHCustomLoadingAnimationView.h"
#import "AFNetworkReachabilityManager.h"
#import "YYWebImageManager.h"
#import "YYDiskCache.h"
#import "YYMemoryCache.h"
@interface NHBaseViewController ()
@property(nonatomic,weak)NHCustomNoNetworkEmptyView *noNetworkEmpyView;
@property(nonatomic,weak)NHCustomLoadingAnimationView *animationView;
@end

@implementation NHBaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIView setAnimationsEnabled:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    NSArray *gestureArry=self.navigationController.view.gestureRecognizers;
//    当侧滑时手势设置scroller需要此手势才可以滑动
    for (UIGestureRecognizer *gesture in gestureArry) {
        if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
            for (UIView *sub in self.view.subviews) {
                if ([sub isKindOfClass:[UIScrollView class]]) {
                    UIScrollView *sc=(UIScrollView*)sub;
                    [sc.panGestureRecognizer requireGestureRecognizerToFail:gesture];
                }
            }
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView setAnimationsEnabled:YES];
//    这个设置可以让位置上移一个navibar
    self.automaticallyAdjustsScrollViewInsets=NO;
//    让控件从navibar下面开始。因为ios7.0鼓励全屏
    self.edgesForExtendedLayout=UIRectEdgeAll;
    self.view.backgroundColor=[UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];
    [NSNotificationCenter addObserver:self action:@selector(requestSuccessNotification) name:kNHRequestSuccessNotification];
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)pop {
    if (self.navigationController == nil) return ;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRootVc {
    if (self.navigationController == nil) return ;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    [self.navigationController popToViewController:vc animated:YES];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissWithCompletion:(void(^)())completion {
    [self dismissViewControllerAnimated:YES completion:completion];
}

- (void)presentVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentVc:vc completion:nil];
}

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentViewController:vc animated:YES completion:completion];
}

- (void)pushVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)removeChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc.view removeFromSuperview];
    [childVc willMoveToParentViewController:nil];
    [childVc removeFromParentViewController];
}

- (void)addChildVc:(UIViewController *)childVc {
    if ([childVc isKindOfClass:[UIViewController class]] == NO) {
        return ;
    }
    [childVc willMoveToParentViewController:self];
    [self addChildViewController:childVc];
    [self.view addSubview:childVc.view];
    childVc.view.frame = self.view.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)loadData {

}


-(NHCustomNoNetworkEmptyView*)noNetworkEmpyView{
    if (_noNetworkEmpyView) {
        NHCustomNoNetworkEmptyView *empty=[[NHCustomNoNetworkEmptyView alloc]init];
        [self.view addSubview:empty];
        _noNetworkEmpyView=empty;
        WeakSelf(weakSelf);
        [empty mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view);
        }];
        empty.customNoNetworkZEmptyViewDidClickRetryHandle=^(NHCustomNoNetworkEmptyView *emptyView){
            [weakSelf loadData];
        };
    }
    return _noNetworkEmpyView;
}
- (void)showLoadingAnimation {
    NHCustomLoadingAnimationView *animation = [[NHCustomLoadingAnimationView alloc] init];
    [animation showInView:self.view];
    _animationView = animation;
    [self.view bringSubviewToFront:animation];
}
-(void)requestSuccessNotification{
    [self hideLoadingAnimation];
}

-(void)hideLoadingAnimation{
    [_animationView dismiss];
    _animationView=nil;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.view bringSubviewToFront:self.animationView];
}

-(BOOL)isNetworkReachable{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    [[[YYWebImageManager sharedManager] cache].diskCache removeAllObjects];
    [[[YYWebImageManager sharedManager] cache].memoryCache removeAllObjects];
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
