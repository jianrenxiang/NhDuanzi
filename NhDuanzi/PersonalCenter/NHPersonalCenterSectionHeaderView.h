//
//  NHPersonalCenterSectionHeaderView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/8.
//  Copyright © 2016年 com.ews. All rights reserved.
//
#import "NHBaseTableHeaderFooterView.h"
#import "NHPersonalCenterHeaderConstant.h"

@class NHPersonalCenterSectionHeaderView;
@protocol NHPersonalCenterSectionHeaderViewDelegate <NSObject>
- (void)personalCenterSectionHeaderView:(NHPersonalCenterSectionHeaderView *)headerView didClickItemwithType:(NHPersonalCenterSectionHeaderViewItemType)type;
@end

@interface NHPersonalCenterSectionHeaderView : NHBaseTableHeaderFooterView

@property (nonatomic, weak) id <NHPersonalCenterSectionHeaderViewDelegate> delegate;

- (void)clickDefault;

@end
