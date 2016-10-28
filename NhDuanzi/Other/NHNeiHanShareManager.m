//
//  NHNeiHanShareManager.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/26.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHNeiHanShareManager.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "WXApi.h"
#import "WeiboSDK.h"
#import <TencentOpenAPI/TencentApiInterface.h>
static NHNeiHanShareManager *_singleton=nil;

@implementation NHNeiHanShareManager

+(instancetype)sharedManage;{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton=[[self alloc]init];
    });
    return _singleton;
}

-(void)shareWithSharedType:(NHNeiHanShareType)shareType image:(UIImage*)image url:(NSString*)url content:(NSString*)content controller:(UIViewController*)controller;{
    switch (shareType) {
        case NHNeiHanShareTypeWechatSession:{
            if ([WXApi isWXAppInstalled]) {
                return;
            }
            UMSocialUrlResource *resoure=[[UMSocialUrlResource alloc]initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:@"http://www.jianshu.com/users/3930920b505b/latest_articles"];
            [[UMSocialDataService defaultDataService]postSNSWithTypes:@[UMShareToWechatSession] content:content image:[UIImage imageNamed:@"digupicon_review_press_1"]  location:nil urlResource:resoure presentedController:controller completion:^(UMSocialResponseEntity *response) {
                if (response.responseCode==UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享成功");
                }
            }];
        } break;
        case NHNeiHanShareTypeWechat:{
            if (![WXApi isWXAppInstalled]) {
                return;
            }
            [UMSocialData defaultData].extConfig.wxMessageType=UMSocialWXMessageTypeImage;
            UMSocialUrlResource *resoure=[[UMSocialUrlResource alloc]initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:url];
            [[UMSocialDataService defaultDataService]postSNSWithTypes:@[UMShareToWechatTimeline] content:content image:image location:nil urlResource:resoure presentedController:controller completion:^(UMSocialResponseEntity *response) {
                if (response.responseCode==UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享朋友圈成功");
                }
            }];
        }   break;
        case NHNeiHanShareTypeWeibo:{
            if (![WXApi isWXAppInstalled]) {
                return;
            }
            UMSocialUrlResource *resoure=[[UMSocialUrlResource alloc]initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:url];
            [[UMSocialDataService defaultDataService]postSNSWithTypes:@[UMShareToSina] content:content image:image location:nil urlResource:resoure presentedController:controller completion:^(UMSocialResponseEntity *response) {
                if (response.responseCode==UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享微博成功");
                }
            }];
        }break;
        case NHNeiHanShareTypeQQ:{
            if (![TencentApiInterface isTencentAppInstall:kIphoneQQ]) {
                return;
            }
            [UMSocialData defaultData].extConfig.qqData.qqMessageType=UMSocialQQMessageTypeImage;
            UMSocialUrlResource *resoure=[[UMSocialUrlResource alloc]initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:url];
            [[UMSocialDataService defaultDataService]postSNSWithTypes:@[UMShareToQQ] content:content image:image location:nil urlResource:resoure presentedController:controller completion:^(UMSocialResponseEntity *response) {
                if (response.responseCode==UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享qq成功");
                }
            }];
        }break;
        case NHNeiHanShareTypeQZone:{
            if (![TencentApiInterface isTencentAppInstall:kIphoneQQ]) {
                return;
            }
            [UMSocialData defaultData].extConfig.qqData.qqMessageType=UMSocialQQMessageTypeImage;
            UMSocialUrlResource *resoure=[[UMSocialUrlResource alloc]initWithSnsResourceType:UMSocialUrlResourceTypeDefault url:nil];
            [[UMSocialDataService defaultDataService]postSNSWithTypes:@[UMShareToQzone] content:content image:image location:nil urlResource:resoure presentedController:controller completion:^(UMSocialResponseEntity *response) {
                if (response.responseCode==UMSResponseCodeSuccess) {
                    [self shareSucceed];
                    NSLog(@"分享qq空间成功");
                }
            }];
        }break;
            default:
            break;
    }
    image=nil;
}
//分享成功
-(void)shareSucceed{
    
}

-(void)registerAllPlatForms;
{
    [UMSocialData setAppKey:@"57cfeda567e58e275c00102d"];
    [UMSocialData openLog:YES];
//    分享url
    [UMSocialWechatHandler setWXAppId:@"wxc01464912319f82e" appSecret:@"a899820621ce623d835c4caf9381762d"  url:@"http://www.jianshu.com/users/3930920b505b/latest_articles"];
    
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.jianshu.com/users/3930920b505b/latest_articles"];
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。需要 #import "UMSocialSinaSSOHandler.h"
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
                                              secret:@"04b48b094faeb16683c32669824ebdad"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];

}
@end
