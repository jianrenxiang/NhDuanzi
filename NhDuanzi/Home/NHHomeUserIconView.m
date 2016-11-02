//
//  NHHomeUserIconView.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/1.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHHomeUserIconView.h"
#import "UIView+Layer.h"
#import "UIView+Tap.h"
@interface NHHomeUserIconView ()
@property(nonatomic,weak)NHBaseImageView *iconImg;
@end

@implementation NHHomeUserIconView

+(instancetype)iconView{
    return  [[self alloc]init];
}

-(void)setIconUrl:(NSString *)iconUrl{
    _iconUrl=iconUrl;
    if (iconUrl.length) {
        [self.iconImg setImageWithUrl:iconUrl];
    }
}

- (void)setImage:(UIImage *)image {
    _image = image;
    if (image) {
        self.iconImg.image = image;
    }
}
- (NHBaseImageView *)iconImg {
    if (!_iconImg) {
        NHBaseImageView *icon = [[NHBaseImageView alloc] init];
        [self addSubview:icon];
        _iconImg = icon;
        icon.userInteractionEnabled = YES;
        WeakSelf(weakSelf);
        [icon setTapActionWithBlock:^{
            if (weakSelf.homeUserIconViewDidClickHandle) {
                weakSelf.homeUserIconViewDidClickHandle(weakSelf);
            }
        }];
        icon.contentMode = UIViewContentModeScaleAspectFill;
        icon.clipsToBounds = YES;
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf);
        }];
        icon.layerCornerRadius = 17.5;
    }
    return _iconImg;
}

@end
