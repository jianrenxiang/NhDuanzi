//
//  NHCustomNoNetworkEmptyView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/28.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHCustomNoNetworkEmptyView : UIView
//没有网络
@property(nonatomic,copy) void(^customNoNetworkZEmptyViewDidClickRetryHandle)(NHCustomNoNetworkEmptyView *view);

@end
