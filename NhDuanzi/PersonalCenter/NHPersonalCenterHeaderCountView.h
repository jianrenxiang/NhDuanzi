//
//  NHPersonalCenterHeaderCountView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/8.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHPersonalCenterHeaderConstant.h"

@class NHPersonalCenterHeaderCountView;
@protocol NHPersonalCenterHeaderCountViewDelegate <NSObject>
- (void)personalCenterHeaderCountView:(NHPersonalCenterHeaderCountView *)countView buttonType:(NHPersonalCenterHeaderViewItemType)buttonType;
@end

@interface NHPersonalCenterHeaderCountView : UIView

@property (nonatomic, weak) id <NHPersonalCenterHeaderCountViewDelegate> delegate;

// 关注、粉丝、积分
@property (nonatomic, assign) NSInteger follow_count;
@property (nonatomic, assign) NSInteger fans_count;
@property (nonatomic, assign) NSInteger share_count;

@end
