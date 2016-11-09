//
//  NHDiscoverTopicRequest.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseRequest.h"

@interface NHDiscoverTopicRequest : NHBaseRequest
@property (nonatomic, assign) NSInteger category_id;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger mpic;;
@property (nonatomic, assign) NSInteger message_cursor;
@end
