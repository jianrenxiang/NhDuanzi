//
//  NHDiscoverSearchRequest.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseRequest.h"

@interface NHDiscoverSearchRequest : NHBaseRequest
@property (nonatomic, copy) NSString *keyword;
@property (nonatomic, assign) NSInteger offset;
@end
