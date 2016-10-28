//
//  NHNeiHanShareManager.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/26.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,NHNeiHanShareType) {
    //    QQ分享
    NHNeiHanShareTypeQQ=1,
    //    qq空间分享
    NHNeiHanShareTypeQZone,
    //微信会话
    NHNeiHanShareTypeWechatSession,
    //微信朋友圈
    NHNeiHanShareTypeWechat,
    //微博
    NHNeiHanShareTypeWeibo,
};

@interface NHNeiHanShareManager : NSObject
+(instancetype)sharedManage;

-(void)shareWithSharedType:(NHNeiHanShareType)shareType image:(UIImage*)image url:(NSString*)url content:(NSString*)content controller:(UIViewController*)controller;


-(void)registerAllPlatForms;
@end
