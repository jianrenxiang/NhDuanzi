//
//  NHAnimationManager.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/2.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHAnimationManager.h"

@implementation NHAnimationManager
//窗口弹出的过程
+(void)addTransformAnimationForView:(UIView *)view{
    view.transform=CGAffineTransformMakeScale(.97, .97);
    [UIView animateWithDuration:0.12 animations:^{
        view.transform=CGAffineTransformIdentity;
        view.alpha=1.0f;
    }];
}

+(void)shakeView:(UIView *)viewToShake{
    CGFloat t=4.0;
    CGAffineTransform translateRight=CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0);
    CGAffineTransform translateLeft=CGAffineTransformScale(CGAffineTransformIdentity, -t, 0);
    viewToShake.transform=translateLeft;
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        viewToShake.transform=translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                viewToShake.transform=CGAffineTransformIdentity;
            } completion:nil];
        }
    }];
}

@end
