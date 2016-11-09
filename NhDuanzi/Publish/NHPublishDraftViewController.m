//
//  NHPublishDraftViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/7.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHPublishDraftViewController.h"
#import "NHCustomPlaceHolderTextView.h"
#import "NHPublishDraftViewController.h"
#import "NHPublishDraftTopView.h"
#import "NHPublishDraftBottomView.h"
#import "NHPublishDraftPictureView.h"
#import "TZImagePickerController.h"
#import "NSNotificationCenter+Addition.h"
#define kMaxInputLimitLength 300
#define kBottomViewH 80
#define kMaxImageCount 9

@interface NHPublishDraftViewController () <NHCustomPlaceHolderTextViewDelegate, NHPublishDraftBottomViewDelegate, TZImagePickerControllerDelegate, NHPublishDraftPictureViewDelegate>
/** 输入框*/
@property (nonatomic, weak) NHCustomPlaceHolderTextView *placeHolderTextView;
/** 顶部视图*/
@property (nonatomic, weak) NHPublishDraftTopView *topView;
/** 底部视图*/
@property (nonatomic, weak) NHPublishDraftBottomView *bottomView;
@property (nonatomic, weak) NHPublishDraftPictureView *pictureView;
/** bottomView的y值*/
@property (nonatomic, assign) CGFloat bottomViewY;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *picArray;
/** 是否为匿名*/
@property (nonatomic, assign) BOOL isAnonymous;
@property (nonatomic, assign) NSInteger category_id;
@end

@implementation NHPublishDraftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. 设置导航栏
    [self setUpItems];
    
    // 2. 设置子视图
    [self setUpViews];
    
    // 3. 添加通知
    [self setUpNotis];
}

// 设置导航栏
- (void)setUpItems {
    // 标题
    self.navigationItem.title = @"投稿";
    
    // 发表
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
}
// 设置子视图
- (void)setUpViews {
    // 设置占位文字
    self.placeHolderTextView.placehoder = @"您的投稿经过段友审核才能发布哦！我们的目标是：专注内涵，拒绝黄反！可以矫情，不要煽情！敬告：发布色情敏感内容会被封号处理";
    self.placeHolderTextView.placeholderFont = kFont(13);
    
    // 设置底部视图
    self.bottomViewY = kScreenHeight - kTopBarHeight - kBottomViewH;
    self.bottomView.limitCount = kMaxInputLimitLength;
    self.bottomView.backgroundColor = kWhiteColor;
}


- (NHCustomPlaceHolderTextView *)placeHolderTextView {
    if (!_placeHolderTextView) {
        NHCustomPlaceHolderTextView *placeHolderTextView = [[NHCustomPlaceHolderTextView alloc] init];
        [self.scrollView addSubview:placeHolderTextView];
        _placeHolderTextView = placeHolderTextView;
        placeHolderTextView.placeholderFont = kFont(14);
        placeHolderTextView.del = self;
        WeakSelf(weakSelf);
        [placeHolderTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.topView);
            make.width.mas_equalTo(weakSelf.view.width);
            make.top.mas_equalTo(weakSelf.topView.mas_bottom);
            make.height.mas_equalTo(200);
        }];
    }
    return _placeHolderTextView;
}

// 添加通知
- (void)setUpNotis {
    [NSNotificationCenter addObserver:self action:@selector(keyBoardWillHiddenNoti:) name:UIKeyboardWillHideNotification];
    [NSNotificationCenter addObserver:self action:@selector(keyBoardWillShowNoti:) name:UIKeyboardWillShowNotification];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
