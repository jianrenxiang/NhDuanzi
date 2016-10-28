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
    
}
@end
