//
//  NHBaseTableHeaderFooterView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/8.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHBaseTableHeaderFooterView : UITableViewHeaderFooterView
/**
 *  快速创建一个不是从xib中加载的tableview header footer
 */
+ (instancetype)headerFooterViewWithTableView:(UITableView *)tableView;
/**
 *  快速创建一个从xib中加载的tableview header footer
 */
+ (instancetype)nibHeaderFooterViewWithTableView:(UITableView *)tableView;
@end
