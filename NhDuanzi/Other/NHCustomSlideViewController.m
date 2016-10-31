//
//  NHCustomSlideViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/31.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHCustomSlideViewController.h"

@interface NHCustomSlideViewController ()
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableDictionary *displayVcs;
@property (nonatomic, strong) NSMutableDictionary *memoryCache;

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, weak) UIViewController *currentViewController;
@end

@implementation NHCustomSlideViewController
- (NSMutableDictionary *)displayVcs {
    if (!_displayVcs) {
        _displayVcs = [[NSMutableDictionary alloc] init];
    }
    return _displayVcs;
}

- (NSMutableDictionary *)memoryCache {
    if (!_memoryCache) {
        _memoryCache = [[NSMutableDictionary alloc] init];
    }
    return _memoryCache;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        UIScrollView *scroll = [[UIScrollView alloc] init];
        [self.view addSubview:scroll];
        _scrollView = scroll;
        scroll.delegate = self;
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.showsVerticalScrollIndicator = NO;
        scroll.pagingEnabled = YES;
        scroll.bounces = NO;
    }
    return _scrollView;
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.scrollView.frame=self.view.bounds;
    self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width * [self childViewControllerCount], self.scrollView.frame.size.height);
    
}
-(void)setSeletedIndex:(NSInteger)seletedIndex{
    _seletedIndex=seletedIndex;
    [self.scrollView setContentOffset:CGPointMake(kScreenWidth*seletedIndex, 0) animated:YES];
}

-(void)reloadData{
    [self.memoryCache removeAllObjects];
    [self.displayVcs removeAllObjects];
    for (NSInteger index=0; index<self.childViewControllers.count; index++) {
        UIViewController *viewController=self.childViewControllers[index];
        [viewController.view removeFromSuperview];
//        当一个视图控制器从视图控制器容器中被添加或者被删除之前
        [viewController willMoveToParentViewController:nil];
        [viewController removeFromParentViewController];
    }
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * [self childViewControllerCount], self.scrollView.frame.size.height);
    [self scrollViewDidScroll:self.scrollView];
}

-(void)scrollViewDidScroll:(UIScrollView*)scrollView{
    NSInteger currentPage=scrollView.contentOffset.x/kScreenWidth;
    NSInteger start=currentPage==0?currentPage:(currentPage);
    NSInteger end=(currentPage==[self childViewControllerCount]-1)?currentPage:(currentPage);
    for (NSInteger index=start; index<=end; index++) {
        UIViewController *viewController=[self.displayVcs objectForKey:@(index)];
        if (viewController==nil) {
            [self initializedViewControllerAtIndex:index];
        }
    }
    // 将start之前和end之后的放入缓存中
    for (NSInteger index = 0; index <= start - 1; index++) {
        UIViewController *viewController = [self.displayVcs objectForKey:@(index)];
        [self removeChildViewController:viewController atIndex:index];
    }
    
    for (NSInteger index = end + 1; index <= [self childViewControllerCount] - 1; index++) {
        UIViewController *viewController = [self.displayVcs objectForKey:@(index)];
        [self removeChildViewController:viewController atIndex:index];
    }
    
    if ([self.delgate respondsToSelector:@selector(customSlideViewController:slideOffset:)]) {
        [self.delgate customSlideViewController:self slideOffset:scrollView.contentOffset];
    }
    
}
// 移除控制器
- (void)removeChildViewController:(UIViewController *)childController atIndex:(NSInteger)index {
    
    if (childController == nil) {
        return ;
    }
    // 当前显示删除、放入缓存中
    [childController.view removeFromSuperview];
    [childController willMoveToParentViewController:nil];
    [childController removeFromParentViewController];
    [self.displayVcs removeObjectForKey:@(index)];
    if (![self.memoryCache objectForKey:@(index)]) {
        [self.memoryCache setObject:childController forKey:@(index)];
    }
}
-(void)initializedViewControllerAtIndex:(NSInteger)index{
    UIViewController *viewController=[self.memoryCache objectForKey:@(index)];
    if (viewController ==nil) {
        if ([self.dataSource respondsToSelector:@selector(slideViewController:viewControllerAtIndex:)]) {
            UIViewController *viewController=[self.dataSource slideViewController:self viewControllerAtIndex:index];
            [self addChildViewController:viewController atIndex:index];
        }
    }
}

-(void)addChildViewController:(UIViewController *)childController atIndex:(NSInteger)index{
    if ([self.childViewControllers containsObject:childController]) {
        return;
    }
    [self addChildViewController:childController];
    [self.displayVcs setObject:childController forKey:@(index)];
    [childController didMoveToParentViewController:self];
    [self.scrollView addSubview:childController.view];
    childController.view.frame=CGRectMake(index*[UIScreen mainScreen].bounds.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
}

-(NSInteger)childViewControllerCount{
    if ([self.dataSource respondsToSelector:@selector(numberOfChildViewControllersInSlideViewController:)]) {
        return [self.dataSource numberOfChildViewControllersInSlideViewController:self];
    }
    return 0;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([self.delgate respondsToSelector:@selector(customSlideViewController:slideIndex:)]) {
        [self.delgate customSlideViewController:self slideIndex:scrollView.contentOffset.x / kScreenWidth];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if ([self.delgate respondsToSelector:@selector(customSlideViewController:slideOffset:)]) {
        [self.delgate customSlideViewController:self slideOffset:scrollView.contentOffset];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ([self.delgate respondsToSelector:@selector(customSlideViewController:slideOffset:)]) {
        [self.delgate customSlideViewController:self slideOffset:scrollView.contentOffset];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
