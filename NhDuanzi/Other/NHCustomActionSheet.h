//
//  NHCustomActionSheet.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/7.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NHCustomActionSheet;
typedef void(^NHCustomActionSheetItemClickHandle) (NHCustomActionSheet *actionSheet,NSInteger currentIndex,NSString *title);
@interface NHCustomActionSheet : UIView

+ (instancetype)actionSheetWithCancelTitle:(NSString *)cancelTitle alertTitle:(NSString *)alertTitle SubTitles:(NSString *)title,...NS_REQUIRES_NIL_TERMINATION;

-(void)setCustomActionSheetItemClickHandle:(NHCustomActionSheetItemClickHandle)itemClickHandle;

-(void)setActionSheetDismissItemClickHandle:(NHCustomActionSheetItemClickHandle)dismissItemClickHandle;

-(void)show;

@end
