//
//  NHHomeAttentionListRequest.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseRequest.h"

@interface NHHomeAttentionListRequest : NHBaseRequest
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, assign) NSInteger homepage_user_id;
@end
