//
//  NHAnimationManager.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/2.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHAnimationManager : NSObject
//某个视图的添加
+(void)addTransformAnimationForView:(UIView*)view;
//让某个视图抖动
+(void)shakeView:(UIView *)viewToShake;

@end
