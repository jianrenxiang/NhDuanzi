//
//  NHFansAttentionHeaderOptionalView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHFansAttentionHeaderOptionalView : UIView
/** 设置当前索引*/
@property (nonatomic, assign) NSInteger selectIndex;
/** 点击回调*/
@property (nonatomic, copy) void(^fansAttentionHeaderOptionalViewBtnClickHandle)(NHFansAttentionHeaderOptionalView *view, UIButton *btn, NSInteger currentIndex);

+ (instancetype)optionalView;

/** 默认选择*/
- (void)clickDefaultWithIndex:(NSInteger)index;
@end
