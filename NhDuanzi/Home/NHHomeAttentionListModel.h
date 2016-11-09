//
//  NHHomeAttentionListModel.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseModel.h"

@interface NHHomeAttentionListModel : NHBaseModel
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger user_id;
@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, copy) NSString *last_update;
@property (nonatomic, copy) NSString *screen_name;

@property (nonatomic, assign) BOOL is_following;
@property (nonatomic, assign) BOOL is_followed;
@property (nonatomic, assign) BOOL user_verified;
@end
