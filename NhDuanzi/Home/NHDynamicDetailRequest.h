//
//  NHDynamicDetailRequest.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseRequest.h"

@interface NHDynamicDetailRequest : NHBaseRequest
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, assign) NSString *sort;
@property (nonatomic, assign) NSInteger group_id;
@end
