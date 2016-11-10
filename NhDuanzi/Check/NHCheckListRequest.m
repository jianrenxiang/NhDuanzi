//
//  NHCheckListRequest.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHCheckListRequest.h"

@implementation NHCheckListRequest
- (NSInteger)max_create_time {
    return [[NSDate date] timeIntervalSince1970] * 1000;
}
@end
