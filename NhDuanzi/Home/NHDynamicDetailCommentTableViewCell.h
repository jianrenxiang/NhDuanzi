//
//  NHDynamicDetailCommentTableViewCell.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewCell.h"

@class NHDynamicDetailCommentCellFrame, NHHomeServiceDataElementComment, NHDynamicDetailCommentTableViewCell;
@protocol NHDynamicDetailCommentTableViewCellDelegate <NSObject>
@optional
/** 分享*/
- (void)commentTableViewCell:(NHDynamicDetailCommentTableViewCell *)commentCell didShareWithCommentModel:(NHHomeServiceDataElementComment *)comment;
/** 点赞*/
- (void)commentTableViewCell:(NHDynamicDetailCommentTableViewCell *)commentCell didLikeWithCommentModel:(NHHomeServiceDataElementComment *)comment;
/** 用户*/
- (void)commentTableViewCell:(NHDynamicDetailCommentTableViewCell *)commentCell didClickUserNameWithCommentModel:(NHHomeServiceDataElementComment *)comment;
/** 回复*/
- (void)commentTableViewCell:(NHDynamicDetailCommentTableViewCell *)commentCell didReplyWithCommentModel:(NHHomeServiceDataElementComment *)comment;
@end
@interface NHDynamicDetailCommentTableViewCell : NHBaseTableViewCell
/** 数据模型*/
@property (nonatomic, strong) NHDynamicDetailCommentCellFrame *cellFrame;
@property (nonatomic, weak) id <NHDynamicDetailCommentTableViewCellDelegate> delegate;

@end
