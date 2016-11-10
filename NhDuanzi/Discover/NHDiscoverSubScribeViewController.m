//
//  NHDiscoverSubScribeViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//
#import "NHDiscoverSubScribeViewController.h"
#import "NHCustomCommonEmptyView.h"
#import "NHDiscoverSubscribeListRequest.h"
#import "NHDiscoverModel.h"
#import "NHDiscoverSubscribeListTableViewCell.h"
#import "NHDiscoverTopicViewController.h"

@interface NHDiscoverSubScribeViewController ()
@property (nonatomic, weak) NHCustomCommonEmptyView *emptyView;
@end

@implementation NHDiscoverSubScribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NHDiscoverSubscribeListRequest *request = [NHDiscoverSubscribeListRequest nh_request];
    request.nh_url = kNHDiscoverSubscribeListAPI;
    [request nh_sendRequeseWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            self.dataArray = [NHDiscoverCategoryElement modelArrayWithDictArray:response];
            [self nh_reloadData];
            self.emptyView.hidden = self.dataArray.count > 0;
        }
    }];
}

#pragma mark - UITableViewDelegate
- (NSInteger)nh_numberOfSections {
    return 1;
}

- (NSInteger)nh_numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NHBaseTableViewCell *)nh_cellAtIndexPath:(NSIndexPath *)indexPath {
    NHDiscoverSubscribeListTableViewCell *cell = [NHDiscoverSubscribeListTableViewCell cellWithTabelView:self.tableView];
    cell.elementModel = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)nh_cellheightAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (void)nh_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(NHBaseTableViewCell *)cell {
    // 数据
    NHDiscoverCategoryElement *element = self.dataArray[indexPath.row];
    
    // 跳转
    NHDiscoverTopicViewController *topicController = [[NHDiscoverTopicViewController alloc] initWithCategoryElement:element];
    //    [[NHDiscoverTopicViewController alloc] initWithCatogoryId:element.ID];
    [self pushVc:topicController];
}

- (NHCustomCommonEmptyView *)emptyView {
    if (!_emptyView) {
        NHCustomCommonEmptyView *empty = [[NHCustomCommonEmptyView alloc] initWithTitle:@"你还没有订阅\n去“热吧”里逛逛" secondTitle:@"" iconname:@""];
        [self.view addSubview:empty];
        _emptyView = empty;
    }
    return _emptyView;
}


@end
