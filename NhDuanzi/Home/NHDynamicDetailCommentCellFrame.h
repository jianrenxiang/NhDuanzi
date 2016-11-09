//
//  NHDynamicDetailCommentCellFrame.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/9.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NHHomeServiceDataElementComment;
@interface NHDynamicDetailCommentCellFrame : NSObject
@property (nonatomic, strong) NHHomeServiceDataElementComment *commentModel;
@property (nonatomic, assign)  CGRect iconImgF;
@property (nonatomic, assign) CGRect nameLF;
@property (nonatomic, assign) CGRect contentLF;
@property (nonatomic, assign) CGRect timeLF;
@property (nonatomic, assign) CGRect likeCountBtnF;
@property (nonatomic, assign) CGRect shareBtnF;
@property (nonatomic, assign) double cellHeight;
@end
