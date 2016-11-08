//
//  NHHomeAttentionViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/31.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHHomeAttentionViewController.h"
#import "NHHomeAttentionRequest.h"
#import "NHHomeBaseViewController.h"
#import "NHHomeAttentionEmptyView.h"
@interface NHHomeAttentionViewController ()
@property(nonatomic,weak) NHHomeAttentionEmptyView  *emptyView;
@end

@implementation NHHomeAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    NHHomeAttentionRequest *request = [NHHomeAttentionRequest nh_request];
    request.nh_url = kNHHomeAttentionDynamicListAPI;
    NHHomeBaseViewController *controller = [[NHHomeBaseViewController alloc] initWithRequest:request];
    [self addChildVc:controller];
    WeakSelf(weakSelf);
    controller.homeBaseViewControllerFinishRequestDataHandle = ^(NSInteger dataCount) {
        weakSelf.emptyView.hidden = dataCount > 0;
    };
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
