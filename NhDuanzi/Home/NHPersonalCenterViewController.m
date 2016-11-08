//
//  NHPersonalCenterViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/7.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHPersonalCenterViewController.h"
#import "NHPersonalCenterHeaderView.h"

@interface NHPersonalCenterViewController ()
@property (nonatomic, strong) NSMutableArray *cellFrameArray;
/** 头部视图*/
@property (nonatomic, strong) NHPersonalCenterHeaderView *headerView;
/** 用户基本信息*/
@property (nonatomic, strong) NHNeiHanUserInfoModel *userInfoModel;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, assign) NHPersonalCenterSectionHeaderViewItemType itemType;
@property (nonatomic, strong) NHPersonalCenterSectionHeaderView *sectionHeaderView;
@property (nonatomic, weak) NHCustomCommonEmptyView *emptyView;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) NHBaseImageView *imageView;
@property (nonatomic, assign) BOOL isSmallScreen;
@end

@implementation NHPersonalCenterViewController

- (instancetype)initWithUserId:(NSInteger)userId {
    if (self = [super init]) {
        self.userId = userId;
    }
    return self;
}

- (instancetype)initWithUserInfoModel:(NHNeiHanUserInfoModel *)userInfoModel {
    if (self = [super init]) {
        self.userInfoModel = userInfoModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏
    [self setUpItems];
    
    // 请求数据
    [self loadData];
}
- (void)setUpItems {
    // 标题
    self.navItemTitle = @"个人中心";
    
    // 退出登陆
    if ([NHUtils isCurrentUserWithUserId:self.userInfoModel.user_id]) {
        WeakSelf(weakSelf);
        [self nh_setUpNavRightItemTitle:@"退出登录" handle:^(NSString *rightItemTitle) {
            NHUserInfoViewController *userInfo = [[NHUserInfoViewController alloc] init];
            [weakSelf pushVc:userInfo];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
