//
//  NHCheckReportBottomView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHCheckReportBottomView : UIView

- (void)showInView:(UIView *)view;

- (void)dismiss;

@property (nonatomic, copy) void(^checkReportBottomViewDidClickReportReasonHandle)(NHCheckReportBottomView *view, NSString *reportStr, NSInteger index);
@end
