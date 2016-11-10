//
//  NHCheckTableViewProgressBar.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NHCheckTableViewProgressBarFinishLoadingHandle)();

@interface NHCheckTableViewProgressBar : UIView

+ (instancetype)bar;

// leftScale + rightScale = 1
@property (nonatomic, assign) CGFloat leftScale;
@property (nonatomic, assign) CGFloat rightScale;

/** 加载loading完毕时候的回调*/
- (void)setUpCheckTableViewProgressBarFinishLoadingHandle:(NHCheckTableViewProgressBarFinishLoadingHandle)finishLoadingHandle;

@end
