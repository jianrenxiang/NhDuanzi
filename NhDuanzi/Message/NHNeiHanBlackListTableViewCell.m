//
//  NHNeiHanBlackListTableViewCell.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHNeiHanBlackListTableViewCell.h"
#import "NHNeiHanUserInfoModel.h"
#import "UIButton+Addition.h"

@interface NHNeiHanBlackListTableViewCell ()

/** 头像*/
@property (nonatomic, weak) UIImageView *iconImg;
/** 名字*/
@property (nonatomic, weak) UILabel *nameL;

@property (nonatomic, weak) UIButton *cancelBtn;

@end

@implementation NHNeiHanBlackListTableViewCell

- (void)setUserInfo:(NHNeiHanUserInfoModel *)userInfo {
    _userInfo = userInfo;
    self.nameL.text = userInfo.name;
    [self.iconImg sd_setImageWithURL:[NSURL URLWithString:userInfo.avatar_url]];
}

- (void)cancelBtnClick:(UIButton *)btn {
    if (self.neiHanBlackListTableViewCellCancelBlackHandle) {
        self.neiHanBlackListTableViewCellCancelBlackHandle(self, self.userInfo);
    }
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        UIButton *cancel = [UIButton buttonWithTitle:@"取消" normalColor:kBlackColor selectedColor:kBlackColor fontSize:16.0 target:self action:@selector(cancelBtnClick:)];
        [self.contentView addSubview:cancel];
        _cancelBtn = cancel;
        WeakSelf(weakSelf);
        [cancel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.contentView).mas_offset(10);
            make.right.mas_equalTo(weakSelf.contentView).mas_equalTo(-10);
            make.height.mas_equalTo(weakSelf.contentView.height - 20);
            make.width.mas_equalTo(75);
        }];
    }
    return _cancelBtn;
}

- (UILabel *)nameL {
    if (!_nameL) {
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        _nameL = label;
        label.font = kFont(14);
        label.textColor = kCommonBlackColor;
        WeakSelf(weakSelf);
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.iconImg.mas_right).mas_offset(10);
            make.right.equalTo(weakSelf.cancelBtn.mas_left).mas_offset(-10);
            make.top.and.bottom.equalTo(weakSelf.iconImg);
        }];
    }
    return _nameL;
}

- (UIImageView *)iconImg {
    if (!_iconImg) {
        UIImageView *img = [[UIImageView alloc] init];
        [self.contentView addSubview:img];
        _iconImg = img;
        img.backgroundColor = kCommonBgColor;
        WeakSelf(weakSelf);
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.mas_equalTo(weakSelf.contentView).mas_offset(10);
            make.height.and.width.mas_equalTo(weakSelf.contentView.height - 10);
        }];
    }
    return _iconImg;
}

@end
