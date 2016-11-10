//
//  NHLaunchAdvertiseMentView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^NHLaunchAdvertiseMentViewCancelHandle)();
typedef void(^NHLaunchAdvertiseMentViewDownloadHandle)();

@interface NHLaunchAdvertiseMentView : UIView

@property (nonatomic, copy) NSString *imgUrl;

- (void)setUpLaunchAdvertiseMentViewCancelHandle:(NHLaunchAdvertiseMentViewCancelHandle)cancelHandle;

- (void)setUpLaunchAdvertiseMentViewDownloadHandle:(NHLaunchAdvertiseMentViewDownloadHandle)downloadHandle;

@end
