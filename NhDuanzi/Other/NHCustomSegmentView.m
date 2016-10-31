//
//  NHCustomSegmentView.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/28.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHCustomSegmentView.h"
#import "UIView+Layer.h"
@implementation NHCustomSegmentView{
    NSArray *_itemTitles;
    UIButton *_selectedBtn;
}

-(instancetype)initWithItemTitles:(NSArray *)itemTitles{
    if (self = [super init]) {
        _itemTitles = itemTitles;
        
        self.layerCornerRadius = 3.0;
        self.layerBorderColor = kCommonTintColor;
        self.layerBorderWidth = 1.0;
        [self setUpViews];
    }
    return self;
}
- (void)setUpViews{
    if (_itemTitles.count>0) {
        NSInteger i=0;
        for (id obj in _itemTitles) {
            if ([obj isKindOfClass:[NSString class]]) {
                NSString *objStr = (NSString *)obj;
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [self addSubview:btn];
                btn.backgroundColor = kCommonBgColor;
                [btn setTitle:objStr forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                [btn setTitleColor:[UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f] forState:UIControlStateNormal];
                btn.titleLabel.font = kFont(16);
                i = i + 1;
                btn.tag = i;
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                btn.adjustsImageWhenDisabled = NO;
                btn.adjustsImageWhenHighlighted = NO;
            }
        }
    }
    
}
- (void)clickDefault {
    if (_itemTitles.count == 0) {
        return ;
    }
    [self btnClick:(UIButton *)[self viewWithTag:1]];
}


-(void)btnClick:(UIButton*)btn{
    _selectedBtn.backgroundColor=kCommonBgColor;
    btn.backgroundColor=[UIColor colorWithRed:0.42 green:0.33 blue:0.27 alpha:1];
    _selectedBtn.selected=NO;
    btn.selected=YES;
    _selectedBtn=btn;
    NSString *title=btn.currentTitle;
    if (self.NHCustomSegmentViewBtnClickHand) {
        self.NHCustomSegmentViewBtnClickHand(self,title,btn.tag-1);
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (_itemTitles.count>0) {
        CGFloat btnW=self.width/_itemTitles.count;
        for (int i=0; i<_itemTitles.count; i++) {
            UIButton *btn=[self viewWithTag:i+1];
            btn.frame=CGRectMake(btnW*i, 0, btnW, self.height);
        }
    }
}

@end
