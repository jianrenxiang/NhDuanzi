//
//  NHHomeTableCellVideoCoverImageView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/4.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseImageView.h"

@interface NHHomeTableCellVideoCoverImageView : NHBaseImageView
@property (nonatomic, copy) void(^homeTableCellVideoDidBeginPlayHandle)(UIButton *playBtn);
@end
