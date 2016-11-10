//
//  NHLocationManager.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AMapLocationKit/AMapLocationKit.h>

typedef void(^NHLocationManagerDidUpdateLocationHandle)(CLLocation *newLocation, NSString *newLatitude, NSString *newLongitude);

@interface NHLocationManager : NSObject

/** 开始定位*/
- (void)startSerialLocation;

+ (instancetype)sharedManager;

/** 更新定位回调*/
- (void)setUpLocationManagerUpdateLocationHandle:(NHLocationManagerDidUpdateLocationHandle)updateLocationHandle;

/** 是否可以定位*/
@property (nonatomic, assign) BOOL canLocationFlag;

/** 是否有经纬度*/
@property (nonatomic, assign) BOOL hasLocation;

@end
