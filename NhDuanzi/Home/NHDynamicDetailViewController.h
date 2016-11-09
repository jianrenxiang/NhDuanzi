//
//  NHDynamicDetailViewController.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewController.h"
@class NHHomeTableViewCellFrame, NHDiscoverSearchCommonCellFrame;
@interface NHDynamicDetailViewController : NHBaseTableViewController
/** 初始化*/
- (instancetype)initWithCellFrame:(NHHomeTableViewCellFrame *)cellFrame;
/** 初始化*/
- (instancetype)initWithSearchCellFrame:(NHDiscoverSearchCommonCellFrame *)searchCellFrame;
@end
