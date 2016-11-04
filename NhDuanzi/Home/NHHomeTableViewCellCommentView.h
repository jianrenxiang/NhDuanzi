//
//  NHHomeTableViewCellCommentView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/4.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NHHomeServiceDataElementComment, NHHomeTableViewCellCommentView;
@protocol NHHomeTableViewCellCommentViewDelegate <NSObject>

/** 分享*/
- (void)homeTableViewCellCommentView:(NHHomeTableViewCellCommentView *)commentView didShareWithCommentModel:(NHHomeServiceDataElementComment *)comment;
/** 回复*/
- (void)homeTableViewCellCommentView:(NHHomeTableViewCellCommentView *)commentView didReplyWithCommentModel:(NHHomeServiceDataElementComment *)comment;
/** 点赞*/
- (void)homeTableViewCellCommentView:(NHHomeTableViewCellCommentView *)commentView didLikeWithCommentModel:(NHHomeServiceDataElementComment *)comment;
/** 用户*/
- (void)homeTableViewCellCommentView:(NHHomeTableViewCellCommentView *)commentView didClickUserNameWithCommentModel:(NHHomeServiceDataElementComment *)comment;

@end

@interface NHHomeTableViewCellCommentView : UIView
/** 数据模型*/
@property (nonatomic, strong) NHHomeServiceDataElementComment *comment;
@property (nonatomic , weak) id <NHHomeTableViewCellCommentViewDelegate> delegate;
@end
