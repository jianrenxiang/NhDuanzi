//
//  NHHomeHeaderOptionalViewItemView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/31.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHHomeHeaderOptionalViewItemView : UILabel
/** 填充色，从左开始*/
@property (nonatomic, strong) UIColor *fillColor;
/** 滑动进度*/
@property (nonatomic, assign) CGFloat progress;
@end
