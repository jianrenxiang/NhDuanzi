//
//  NHBaseRequest.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/27.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseRequest.h"
#import "MJExtension.h"
#import "NHRequestManager.h"
#import "NSString+Addition.h"
#import "NSNotificationCenter+Addition.h"
@implementation NHBaseRequest
+(instancetype)nh_request;{
    return [[self alloc]init];
}
+(instancetype)nh_requestWitnUrl:(NSString*)url;{
    return [self nh_requestWitnUrl:url];
}
+(instancetype)nh_requestWitnUrl:(NSString*)url isPost:(BOOL)isPost;{
    return [self nh_requestWitnUrl:url isPost:NO delegate:nil];
}
+(instancetype)nh_requestWitnUrl:(NSString *)url isPost:(BOOL)isPost delegate:(id <NHBaseRequestResponseDelegate>)nh_delegate;{
    NHBaseRequest *request=[self nh_request];
    request.nh_url=url;
    request.nh_isPost=isPost;
    request.nh_delegate=nh_delegate;
    return request;
}

-(void)nh_sendRequese;{
    [self nh_sendRequeseWithCompletion:nil];
}

-(void)nh_sendRequeseWithCompletion:(NHAPIDicCompletion)completion;{
    NSString *urlStr=self.nh_url;
    if (urlStr.length==0) {
        return;
    }
    NSDictionary *params=[self params];
    if (self.nh_isPost) {
        if (self.nh_imageArray.count==0) {
            [NHRequestManager POST:[urlStr noWhiteSpaceString] parameters:params responseSeializerType:NHResponseSeializerTypeJSON success:^(id responseObject) {
                [self handleResponse:responseObject completion:completion];
            } failure:^(NSError *error) {
                //数据请求失败
            }];
        }
    }else{
        //普通get请求
        [NHRequestManager GET:[urlStr noWhiteSpaceString] parameters:params responseSeializerType:NHResponseSeializerTypeJSON success:^(id responseObject) {
            [self handleResponse:responseObject completion:completion];
        } failure:^(NSError *error) {
            
        }];
    }
    //上传图片
    if (self.nh_imageArray.count) {
        [NHRequestManager POST:[urlStr noWhiteSpaceString] parameters:params responseSeializerType:NHResponseSeializerTypeJSON constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            NSInteger imgCount=0;
            for (UIImage *image in self.nh_imageArray) {
                NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
                formatter.dateFormat=@"yyyy-MM-dd HH:mm:ss:SSS";
                NSString *fileName=[NSString stringWithFormat:@"%@%@.png",[formatter stringFromDate:[NSDate date]],@(imgCount)];
                [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"file" fileName:fileName mimeType:@"image/png"];
                imgCount++;
            }
        } success:^(id responseObject) {
            [self handleResponse:responseObject completion:completion];
        } failure:^(NSError *error) {
//            数据请求失败
        }];
    }
}
-(void)setNh_url:(NSString *)nh_url{
    if (nh_url.length == 0 || [nh_url isKindOfClass:[NSNull class]]) {
        return ;
    }
    _nh_url = nh_url;
}
-(void)handleResponse:(id)responseObject completion:(NHAPIDicCompletion)completion{
    if ([responseObject[@"message"] isEqualToString:@"retry"]) {
        [self nh_sendRequeseWithCompletion:completion];
    }
    BOOL success=[responseObject[@"message"] isEqualToString:@"success"];
    if (completion) {
        completion(responseObject[@"data"],success,@"");
    }else if (self.nh_delegate){
        
        if ([self.nh_delegate respondsToSelector:@selector(requestSuccessResponse:response:message:)]) {
            [self.nh_delegate requestSuccessResponse:success response:responseObject[@"data"] message:@""];
        }
    }
    //请求成功，发布通知
    [NSNotificationCenter postNotification:kNHRequestSuccessNotification];
}

- (NSDictionary *)params {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"tag"] = @"joke";
    params[@"iid"] = @"5316804410";
    params[@"os_version"] = @"9.3.4";
    params[@"os_api"] = @"18";
    
    params[@"app_name"] = @"joke_essay";
    params[@"channel"] = @"App Store";
    params[@"device_platform"] = @"iphone";
    params[@"idfa"] = @"832E262C-31D7-488A-8856-69600FAABE36";
    params[@"live_sdk_version"] = @"120";
    
    params[@"vid"] = @"4A4CBB9E-ADC3-426B-B562-9FC8173FDA52";
    params[@"openudid"] = @"cbb1d9e8770b26c39fac806b79bf263a50da6666";
    params[@"device_type"] = @"iPhone 6 Plus";
    params[@"version_code"] = @"5.5.0";
    params[@"ac"] = @"WIFI";
    params[@"screen_width"] = @"1242";
    params[@"device_id"] = @"10752255605";
    params[@"aid"] = @"7";
    params[@"count"] = @"50";
    params[@"max_time"] = [NSString stringWithFormat:@"%.2f", [[NSDate date] timeIntervalSince1970]];
    
    [params addEntriesFromDictionary:self.mj_keyValues];
    
    if ([params.allKeys containsObject:@"nh_delegate"]) {
        [params removeObjectForKey:@"nh_delegate"];
    }
    if ([params.allKeys containsObject:@"nh_isPost"]) {
        [params removeObjectForKey:@"nh_isPost"];
    }
    if ([params.allKeys containsObject:@"nh_url"]) {
        [params removeObjectForKey:@"nh_url"];
    }
    if (self.nh_imageArray.count == 0) {
        if ([params.allKeys containsObject:@"nh_imageArray"]) {
            [params removeObjectForKey:@"nh_imageArray"];
        }
    }
    return params;
}

@end
