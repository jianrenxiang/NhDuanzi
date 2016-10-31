//
//  NHHomeHeaderOptionalView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/31.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHHomeHeaderOptionalView : UIView

/** 标题数组*/
@property (nonatomic, strong) NSArray <NSString *>*titles;
/** 点击item回调*/
@property(nonatomic,copy)void (^homeHeaderOptionalViewItemClickHandle)(NHHomeHeaderOptionalView *optialView,NSString *title,NSInteger currentIndex);
/**
 *  偏移量
 */
@property(nonatomic,assign)CGPoint contentOffset;
@end
