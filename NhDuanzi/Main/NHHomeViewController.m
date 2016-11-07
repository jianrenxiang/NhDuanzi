	//
//  NHHomeViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/27.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHHomeViewController.h"
#import "NHCustomSegmentView.h"
#import "NHCustomSlideViewController.h"
#import "NHHomeHeaderOptionalView.h"
#import "NHHomeAttentionViewController.h"
#import "NHServiceListModel.h"
#import "NHCustomWebViewController.h"
#import "NHHomeBaseViewController.h"
#import "NHHomeUserIconView.h"
#import "NHUserInfoManager.h"
#import "NHLoginViewController.h"
#import "NHHomeBaseViewController.h"
#import "NHPersonalCenterViewController.h"
#import "NHPublishDraftViewController.h"
@interface NHHomeViewController ()<NHCustomSlideViewControllerDataSource,NHCustomSlideViewControllerDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) NHCustomSlideViewController *slideViewController;
@property (nonatomic, weak) NHHomeAttentionViewController *attentionController;
@property (nonatomic, weak) NHHomeHeaderOptionalView *optionalView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *urls;
@end

@implementation NHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpItems];
}
// 设置数据
- (void)setModels:(NSArray <NHServiceListModel *> *)models {
    if (models.count == 0) {
        return ;
    }
    for (NHServiceListModel *model in models) {
        if ([model.name isKindOfClass:[NSString class]]) {
            [self.titles addObject:model.name];
        }
        if ([model.url isKindOfClass:[NSString class]]) {
            [self.urls addObject:model.url];
        }
    }
    // 设置子视图
    [self setUpViews];
}
-(void)setUpViews{
    if (self.titles.count==0) {
        return;
    }
    if (self.titles.count!=self.urls.count) {
        return;
    }
    for (int i=0; i<self.urls.count; i++) {
        NSString *url = self.urls[i];
        NSString *title = self.titles[i];
        if ([title isEqualToString:@"游戏"]) {
            NHCustomWebViewController *controller = [[NHCustomWebViewController alloc] initWithUrl:url];
            [self.controllers addObject:controller];
        }else if ([title isEqualToString:@"精华"]){
            
        }else{
            NHHomeBaseViewController *homeBase=[[NHHomeBaseViewController alloc]initWithUrl:url];
            [self.controllers addObject:homeBase];
            
        }
    }
    if ([self.titles containsObject:@"精华"]) {
        [self.titles removeObject:@"精华"];
    }
    WeakSelf(weakSelf);
    self.optionalView.titles = self.titles.copy;
    self.optionalView.homeHeaderOptionalViewItemClickHandle = ^(NHHomeHeaderOptionalView *view, NSString *currentTitle, NSInteger currentIndex) {
        weakSelf.slideViewController.seletedIndex = currentIndex;
    };
    [self.slideViewController reloadData];
}

-(void)setUpItems{
    WeakSelf(weakSelf);
    NHCustomSegmentView *segment=[[NHCustomSegmentView alloc]initWithItemTitles:@[@"精选",@"关注"]];
    self.navigationItem.titleView=segment;
    segment.frame=CGRectMake(0, 0, 130, 35);
    [segment clickDefault];
    segment.NHCustomSegmentViewBtnClickHand=^(NHCustomSegmentView *segment, NSString *title, NSInteger currentIndex) {
        BOOL isFeatured = (currentIndex == 0);
        weakSelf.optionalView.hidden = weakSelf.slideViewController.view.hidden = !isFeatured;
        weakSelf.attentionController.view.hidden =  isFeatured;
    };
    NHHomeUserIconView *iconView=[[NHHomeUserIconView alloc]init];
    iconView.frame=CGRectMake(-10, 0, 35, 35);
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:iconView];
    iconView.homeUserIconViewDidClickHandle=^(NHHomeUserIconView *iconView){
        [weakSelf leftItemClick];
    };
    if (![NHUserInfoManager sharedManager].isLogin) {
        iconView.image = [UIImage imageNamed:@"defaulthead"];
    } else {
        iconView.iconUrl = [NHUserInfoManager sharedManager].currentUserInfo.avatar_url;
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"submission"] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    
}
- (void)leftItemClick{
    if (![NHUserInfoManager sharedManager].isLogin) {
        NHLoginViewController *loginController = [[NHLoginViewController alloc] init];
        [self pushVc:loginController];
    } else {
        NHPersonalCenterViewController *personalCenter = [[NHPersonalCenterViewController alloc] initWithUserInfoModel:[[NHUserInfoManager sharedManager] currentUserInfo]];
        [self pushVc:personalCenter];
    }
}

-(void)rightItemClick{
    NHPublishDraftViewController *publish = [[NHPublishDraftViewController alloc] init];
    [self pushVc:publish];
}
-(NHHomeHeaderOptionalView*)optionalView{
    if (!_optionalView) {
        NHHomeHeaderOptionalView *optional=[[NHHomeHeaderOptionalView alloc]init];
        optional.frame=CGRectMake(0, 0, kScreenWidth, 40);
        [self.view addSubview:optional];
        _optionalView=optional;
        _optionalView.backgroundColor=kWhiteColor;
        
    }
    return _optionalView;
}

-(NHCustomSlideViewController*)slideViewController{
    if (!_slideViewController) {
        NHCustomSlideViewController *slide=[[NHCustomSlideViewController alloc]init];
        [slide willMoveToParentViewController:self];
        [self addChildViewController:slide];
        [self.view addSubview:slide.view];
        slide.view.frame=CGRectMake(0, self.optionalView.height, kScreenWidth, kScreenHeight-self.optionalView.height-kTopBarHeight-kTabBarHeight);
        slide.dataSource=self;
        slide.delgate=self;
        _slideViewController=slide;
    }
    return _slideViewController;
}

-(NHHomeAttentionViewController*)attentionController{
    if (!_attentionController) {
        NHHomeAttentionViewController *attention=[[NHHomeAttentionViewController alloc]init];
        [attention willMoveToParentViewController:self];
        [self addChildViewController:attention];
        [self.view addSubview:attention.view];
        attention.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight - kTabBarHeight);
        _attentionController = attention;
    }
    return _attentionController;
}

- (NSInteger)numberOfChildViewControllersInSlideViewController:(NHCustomSlideViewController *)slideViewController {
    return self.titles.count;
}
- (UIViewController *)slideViewController:(NHCustomSlideViewController *)slideViewController viewControllerAtIndex:(NSInteger)index {
    return self.controllers[index];
}
- (void)customSlideViewController:(NHCustomSlideViewController *)slideViewController slideOffset:(CGPoint)slideOffset {
    self.optionalView.contentOffset = slideOffset;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}

- (NSMutableArray *)titles {
    if (!_titles) {
        _titles = [NSMutableArray new];
    }
    return _titles;
}

- (NSMutableArray *)urls {
    if (!_urls) {
        _urls = [NSMutableArray new];
    }
    return _urls;
}
@end
