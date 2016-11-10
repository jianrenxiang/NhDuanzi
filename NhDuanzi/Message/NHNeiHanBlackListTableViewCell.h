//
//  NHNeiHanBlackListTableViewCell.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewCell.h"
@class NHNeiHanUserInfoModel;

@interface NHNeiHanBlackListTableViewCell : NHBaseTableViewCell
@property (nonatomic, strong) NHNeiHanUserInfoModel *userInfo;

@property (nonatomic, copy) void(^neiHanBlackListTableViewCellCancelBlackHandle)(NHNeiHanBlackListTableViewCell *cell, NHNeiHanUserInfoModel *userInfo);

@end
