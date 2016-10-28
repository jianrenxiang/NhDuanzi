//
//  NHHomeViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/27.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHHomeViewController.h"

@interface NHHomeViewController ()
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
    
}

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
