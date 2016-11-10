//
//  NHDiscoverHeaderView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NHDiscoverHeaderViewViewCell, NHDiscoverRotate_bannerElementBanner_url_URL, NHDiscoverRotate_bannerElement;
@interface NHDiscoverHeaderView : UIView
/** 数据源*/
@property (nonatomic, strong) NSArray <NHDiscoverRotate_bannerElement *>*modelArray;
/** 点击回调*/
@property (nonatomic, copy) void(^discoverHeaderViewGoToPageHandle)(NHDiscoverHeaderViewViewCell *cell, NHDiscoverRotate_bannerElement *bannerUrlModel);

@end
