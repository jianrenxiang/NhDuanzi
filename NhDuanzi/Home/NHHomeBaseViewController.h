//
//  NHHomeBaseViewController.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/1.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewController.h"

@class NHBaseRequest;
@interface NHHomeBaseViewController : NHBaseTableViewController
//初始化
-(instancetype)initWithUrl:(NSString*)url;
//初始化
-(instancetype)initWithRequest:(NHBaseRequest*)request;
/**  请求回调*/
@property (nonatomic, copy) void(^homeBaseViewControllerFinishRequestDataHandle)(NSInteger dataCount);
@end
