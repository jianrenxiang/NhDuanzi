//
//  NHCustomAlertView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/2.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHCustomAlertView : UIView
//取消
-(void)setupCancelBlcok:(BOOL (^)())cancelBlock;
//确定
-(void)setupSureBlock:(BOOL (^)())touchBlock;
//显示信息
-(void)showInView:(UIView *)view;

-(instancetype)initWithTitle:(NSString *)title cancel:(NSString *)cancel sure:(NSString*)sure;

@end
