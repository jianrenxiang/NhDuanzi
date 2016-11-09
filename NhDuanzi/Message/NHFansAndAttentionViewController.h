//
//  NHFansAndAttentionViewController.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseViewController.h"

typedef NS_ENUM(NSUInteger, NHFansAndAttentionVcType) {
    /** 关注*/
    NHFansAndAttentionViewControllerAttention,
    /** 粉丝*/
    NHFansAndAttentionViewControllerFans,
};

@interface NHFansAndAttentionViewController : NHBaseViewController
/** 构造方法*/
- (instancetype)initWithUserId:(NSInteger)userId vcType:(NHFansAndAttentionVcType)vcType;

@end
