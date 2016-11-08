//
//  NHPersonalCenterHeaderView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/8.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHPersonalCenterHeaderConstant.h"

@class NHPersonalCenterHeaderView, NHNeiHanUserInfoModel;
@protocol NHPersonalCenterHeaderViewDelegate <NSObject>

- (void)personalCenterHeaderView:(NHPersonalCenterHeaderView *)headerView didClickItemWithType:(NHPersonalCenterHeaderViewItemType)itemType;

@end

@interface NHPersonalCenterHeaderView : UIView
/** 用户信息*/
@property (nonatomic, strong) NHNeiHanUserInfoModel *userInfoModel;

@property (nonatomic, weak) id <NHPersonalCenterHeaderViewDelegate> delegate;

@end
