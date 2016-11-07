//
//  NHPersonalCenterViewController.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/7.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewController.h"

@class NHNeiHanUserInfoModel;
@interface NHPersonalCenterViewController : NHBaseTableViewController
/** 初始化*/
- (instancetype)initWithUserInfoModel:(NHNeiHanUserInfoModel *)userInfoModel;
/** 初始化*/
- (instancetype)initWithUserId:(NSInteger)userId;

@end
