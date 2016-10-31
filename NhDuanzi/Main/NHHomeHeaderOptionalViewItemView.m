//
//  NHHomeHeaderOptionalViewItemView.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/31.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHHomeHeaderOptionalViewItemView.h"

@implementation NHHomeHeaderOptionalViewItemView

-(void)setProgress:(CGFloat)progress{
    _progress=progress;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [_fillColor set];
    CGRect newRect=rect;
    newRect.size.width = rect.size.width * self.progress;
//    在当前图形上下文中绘制矩形区域。如果当前图形上下文为nil，这个方法什么也不做
    UIRectFillUsingBlendMode(newRect, kCGBlendModeSourceIn);
}

@end
