//
//  NHCustomSegmentView.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/28.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHCustomSegmentView : UIView

-(instancetype)initWithItemTitles:(NSArray*)itemTitles;

@property(nonatomic,copy)void(^NHCustomSegmentViewBtnClickHand)(NHCustomSegmentView *segment,NSString *currentTitle,NSInteger currentIndex);
- (void)clickDefault;
@end
