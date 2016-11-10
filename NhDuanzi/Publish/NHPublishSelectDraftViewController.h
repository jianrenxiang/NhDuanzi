//
//  NHPublishSelectDraftViewController.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewController.h"

@interface NHPublishSelectDraftViewController : NHBaseTableViewController
/** 点击回调*/
@property (nonatomic, copy) void(^publishSelectDraftSelectNameHandle)(NHPublishSelectDraftViewController *controller, NSString *name, NSInteger cateogry_id);
@end
