//
//  NHCustomSlideViewController.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/31.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NHCustomSlideViewController;
@protocol NHCustomSlideViewControllerDelegate <NSObject>
@optional
- (void)customSlideViewController:(NHCustomSlideViewController *)slideViewController slideOffset:(CGPoint)slideOffset;
- (void)customSlideViewController:(NHCustomSlideViewController *)slideViewController slideIndex:(NSInteger)slideIndex;
@end
@protocol NHCustomSlideViewControllerDataSource <NSObject>
/** 子控制器*/
- (UIViewController *)slideViewController:(NHCustomSlideViewController *)slideViewController viewControllerAtIndex:(NSInteger)index;
/** 子控制器数量*/
- (NSInteger)numberOfChildViewControllersInSlideViewController:(NHCustomSlideViewController *)slideViewController;
@end
@interface NHCustomSlideViewController : UIViewController
@property (nonatomic, weak) id <NHCustomSlideViewControllerDelegate> delgate;
@property (nonatomic, weak) id <NHCustomSlideViewControllerDataSource> dataSource;
@property (nonatomic, assign) NSInteger seletedIndex;
- (void)reloadData;
@end
