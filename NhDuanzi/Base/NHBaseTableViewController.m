//
//  NHBaseTableViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/1.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewController.h"
#import <objc/runtime.h>
const char NHBaseTableVcNavRightItemHandleKey;
const char NHBaseTableVcNavLeftItemHandleKey;
@interface NHBaseTableViewController ()
@property (nonatomic, copy) NHTableVcCellSelectedHandle handle;
@property (nonatomic, weak) UIImageView *refreshImg;
@end

@implementation NHBaseTableViewController
@synthesize needCellSepLine = _needCellSepLine;
@synthesize sepLineColor = _sepLineColor;
@synthesize navItemTitle = _navItemTitle;
@synthesize navRightItem = _navRightItem;
@synthesize navLeftItem = _navLeftItem;
@synthesize hiddenStatusBar = _hiddenStatusBar;
@synthesize barStyle = _barStyle;

-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
- (NHBaseTableView *)tableView {
    if(!_tableView){
        NHBaseTableView *tab = [[NHBaseTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:tab];
        _tableView = tab;
        tab.dataSource = self;
        tab.delegate = self;
        tab.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];
        tab.separatorColor = kSeperatorColor;
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}
/** 设置导航栏右边的item*/
- (void)nh_setUpNavRightItemTitle:(NSString *)itemTitle handle:(void(^)(NSString *rightItemTitle))handle {
    [self nh_setUpNavItemTitle:itemTitle handle:handle leftFlag:NO];
}
/** 设置导航栏左边的item*/
- (void)nh_setUpNavLeftItemTitle:(NSString *)itemTitle handle:(void(^)(NSString *leftItemTitle))handle {
    [self nh_setUpNavItemTitle:itemTitle handle:handle leftFlag:YES];
}

- (void)nh_navItemHandle:(UIBarButtonItem *)item {
    void (^handle)(NSString *) = objc_getAssociatedObject(self, &NHBaseTableVcNavRightItemHandleKey);
    if (handle) {
        handle(item.title);
    }
}

- (void)nh_setUpNavItemTitle:(NSString *)itemTitle handle:(void(^)(NSString *itemTitle))handle leftFlag:(BOOL)leftFlag {
    if (itemTitle.length == 0 || !handle) {
        if (itemTitle == nil) {
            itemTitle = @"";
        } else if ([itemTitle isKindOfClass:[NSNull class]]) {
            itemTitle = @"";
        }
        if (leftFlag) {
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:itemTitle style:UIBarButtonItemStylePlain target:nil action:nil];
        } else {
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:itemTitle style:UIBarButtonItemStylePlain target:nil action:nil];
        }
    } else {
        if (leftFlag) {
            //            handle被销毁还有用，只要 self 没被销毁
            objc_setAssociatedObject(self, &NHBaseTableVcNavLeftItemHandleKey, handle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:itemTitle style:UIBarButtonItemStylePlain target:self action:@selector(nh_navItemHandle:)];
        } else {
            objc_setAssociatedObject(self, &NHBaseTableVcNavRightItemHandleKey, handle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:itemTitle style:UIBarButtonItemStylePlain target:self action:@selector(nh_navItemHandle:)];
        }
    }
    
}
/** 监听通知*/
- (void)nh_observeNotiWithNotiName:(NSString *)notiName action:(SEL)action {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:action name:notiName object:nil];
}
/** 设置刷新类型*/
- (void)setRefreshType:(NHBaseTableVcRefreshType)refreshType {
    _refreshType = refreshType;
    switch (refreshType) {
        case NHBaseTableVcRefreshTypeNone: // 没有刷新
            break ;
        case NHBaseTableVcRefreshTypeOnlyCanRefresh: { // 只有下拉刷新
            [self nh_addRefresh];
        } break ;
        case NHBaseTableVcRefreshTypeOnlyCanLoadMore: { // 只有上拉加载
            [self nh_addLoadMore];
        } break ;
        case NHBaseTableVcRefreshTypeRefreshAndLoadMore: { // 下拉和上拉都有
            [self nh_addRefresh];
            [self nh_addLoadMore];
        } break ;
        default:
            break ;
    }
}
- (void)nh_addRefresh {
    [NHUtils addPullRefreshForScrollView:self.tableView pullRefreshCallBack:^{
        [self nh_refresh];
    }];
}
- (void)nh_addLoadMore {
    [NHUtils addLoadMoreForScrollView:self.tableView loadMoreCallBack:^{
        [self nh_loadMore];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
