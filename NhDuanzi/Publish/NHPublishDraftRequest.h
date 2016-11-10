//
//  NHPublishDraftRequest.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseRequest.h"

@interface NHPublishDraftRequest : NHBaseRequest
@property (nonatomic, assign) NSInteger category_id;
@property (nonatomic, assign) BOOL is_anonymous;
@property (nonatomic, assign) NSString *text;
@property (nonatomic, assign) NSInteger user_id;
@end
