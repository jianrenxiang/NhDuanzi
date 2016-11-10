//
//  NHDiscoverSearchFriendCell.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewCell.h"
@class NHNeiHanUserInfoModel;
@interface NHDiscoverSearchFriendCell : NHBaseTableViewCell
/** 关键词*/
@property (nonatomic, copy) NSString *keyWord;
/** 数据源*/
@property (nonatomic, strong) NSArray <NHNeiHanUserInfoModel *>*models;
/** 更多段友*/
@property (nonatomic, copy) void(^discoverSearchFriendCellMoreFriends)();
/** 个人中心*/
@property (nonatomic, copy) void(^discoverSearchFriendCellGotoPersonalCenter)(NSInteger user_id);
@end
