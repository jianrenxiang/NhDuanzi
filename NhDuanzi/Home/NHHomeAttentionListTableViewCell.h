//
//  NHHomeAttentionListTableViewCell.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewCell.h"
@class NHHomeAttentionListModel, NHHomeAttentionListTableViewCell;
@protocol NHHomeAttentionListTableViewCellDelegate <NSObject>
/** 个人中心*/
- (void)homeAttentionListTableViewCell:(NHHomeAttentionListTableViewCell *)cell didGotoPersonalCenterWithUserId:(NSInteger)userId;
/** 关注*/
- (void)homeAttentionListTableViewCellDidClickAttention:(NHHomeAttentionListTableViewCell *)cell;
@end

@interface NHHomeAttentionListTableViewCell : NHBaseTableViewCell
/** 数据*/
@property (nonatomic, strong) NHHomeAttentionListModel *model;
@property (nonatomic, weak) id <NHHomeAttentionListTableViewCellDelegate> delegate;

/** 关注成功或者取消关注成功*/
- (void)attSuccessWithAttFlag:(BOOL)flag;
@end
