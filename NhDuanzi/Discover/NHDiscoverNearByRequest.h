//
//  NHDiscoverNearByRequest.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseRequest.h"

@interface NHDiscoverNearByRequest : NHBaseRequest
@property (nonatomic, assign) NSInteger gender; // - 1全部 0男 1女 2不明
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;
@end
