//
//  NHPublishSelectDraftModel.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/10.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseModel.h"

@interface NHPublishSelectDraftModel : NHBaseModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, assign) NSInteger subscribe_count;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) BOOL allow_gif;
@property (nonatomic, assign) BOOL allow_video;
@property (nonatomic, assign) BOOL allow_text;
@property (nonatomic, assign) BOOL allow_multi_image;
@end
