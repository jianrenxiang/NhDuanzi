//
//  NHBaseTableViewController.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/1.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseViewController.h"

typedef void (^NHTableVcCellSelectedHandle)(UITableViewCell *cell,NSIndexPath *indexPath);

typedef NS_ENUM(NSUInteger,NHBaseTableVcRefreshType){
    /** 无法刷新*/
    NHBaseTableVcRefreshTypeNone = 0,
    /** 只能刷新*/
    NHBaseTableVcRefreshTypeOnlyCanRefresh,
    /** 只能上拉加载*/
    NHBaseTableVcRefreshTypeOnlyCanLoadMore,
    /** 能刷新*/
    NHBaseTableVcRefreshTypeRefreshAndLoadMore
};

@interface NHBaseTableViewController : NHBaseViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *dataArray;
}
@end
