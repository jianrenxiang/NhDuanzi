//
//  NHHomeDynamicRequest.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/7.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseRequest.h"

@interface NHHomeDynamicRequest : NHBaseRequest
/** bury 踩 digg 顶*/
@property (nonatomic, copy) NSString *action;
@property (nonatomic, assign) NSInteger group_id;
@end
