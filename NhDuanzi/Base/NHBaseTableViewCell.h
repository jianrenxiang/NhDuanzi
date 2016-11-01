//
//  NHBaseTableViewCell.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/1.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHBaseTableViewCell : UITableViewCell

@property (nonatomic, weak) UITableView *tableView;

+(instancetype)cellWithTabelView:(UITableView*)tableView;

+(instancetype)nibCellWithTableView:(UITableView*)tabelView;

@end
