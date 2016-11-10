//
//  NHDiscoverTableViewCell.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewCell.h"

@class NHDiscoverCategoryElement;
@interface NHDiscoverTableViewCell : NHBaseTableViewCell
/** 设置数据*/
@property (nonatomic, strong) NHDiscoverCategoryElement *elementModel;

- (void)setElementModel:(NHDiscoverCategoryElement *)elementModel keyWord:(NSString *)keyWord;

@end
