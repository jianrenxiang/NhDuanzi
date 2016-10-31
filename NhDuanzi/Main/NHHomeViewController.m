//
//  NHHomeViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/27.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHHomeViewController.h"
#import "NHCustomSegmentView.h"
#import "NHCustomSlideViewController.h"
#import "NHHomeHeaderOptionalView.h"
#import "NHHomeAttentionViewController.h"
@interface NHHomeViewController ()
@property (nonatomic, weak) NHCustomSlideViewController *slideViewController;
@property (nonatomic, weak) NHHomeAttentionViewController *attentionController;
@property (nonatomic, weak) NHHomeHeaderOptionalView *optionalView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *urls;
@end

@implementation NHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpItems];
}

-(void)setUpViews{
    if (self.titles.count==0) {
        return;
    }
    if (self.titles.count!=self.urls.count) {
        return;
    }
    for (int i=0; i<self.urls.count; i++) {
        NSString *url = self.urls[i];
        NSString *title = self.titles[i];
        if ([title isEqualToString:@"游戏"]) {
            
        }
    }
}

-(void)setUpItems{
    WeakSelf(weakSelf);
    NHCustomSegmentView *segment=[[NHCustomSegmentView alloc]initWithItemTitles:@[@"精选",@"关注"]];
    self.navigationItem.titleView=segment;
    segment.frame=CGRectMake(0, 0, 130, 35);
    [segment clickDefault];
    segment.NHCustomSegmentViewBtnClickHand=^(NHCustomSegmentView *segment, NSString *title, NSInteger currentIndex) {
        BOOL isFeatured = (currentIndex == 0);
        weakSelf.optionalView.hidden = weakSelf.slideViewController.view.hidden = !isFeatured;
        weakSelf.attentionController.view.hidden =  isFeatured;
    };

    
    
}

-(NHHomeHeaderOptionalView*)optionalView{
    if (!_optionalView) {
        
    }
}

//-(NHCustomSlideViewController*)slideViewController{
//    if (!) {
//        
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}

- (NSMutableArray *)titles {
    if (!_titles) {
        _titles = [NSMutableArray new];
    }
    return _titles;
}

- (NSMutableArray *)urls {
    if (!_urls) {
        _urls = [NSMutableArray new];
    }
    return _urls;
}
@end
