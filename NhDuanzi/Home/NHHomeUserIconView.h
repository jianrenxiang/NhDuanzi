//
//  NHHomeUserIconView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/1.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHHomeUserIconView : UIView
+ (instancetype)iconView;

/** 头像链接*/
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, strong) UIImage *image;
/** 点击头像回调*/
@property (nonatomic, copy) void(^homeUserIconViewDidClickHandle)(NHHomeUserIconView *iconView);

@end
