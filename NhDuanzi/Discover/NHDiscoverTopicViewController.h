//
//  NHDiscoverTopicViewController.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/7.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseViewController.h"

@class NHDiscoverCategoryElement;
@interface NHDiscoverTopicViewController : NHBaseViewController

/**
 * 构造方法
 * catogoryId : 分类Id
 */
- (instancetype)initWithCatogoryId:(NSInteger)categoryId;

- (instancetype)initWithCategoryElement:(NHDiscoverCategoryElement *)element;

@end
