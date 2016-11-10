//
//  NHDiscoverNearByUserModel.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseModel.h"

@interface NHDiscoverNearByUserModel : NHBaseModel
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *screen_name;
@property (nonatomic, assign) NSInteger user_id;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger last_update;
@end
