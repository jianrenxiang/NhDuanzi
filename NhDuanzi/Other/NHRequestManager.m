//
//  NHRequestManager.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/27.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHRequestManager.h"

@interface AFHTTPSessionManager(shared)
+(instancetype)sharedManager;
@end
@implementation AFHTTPSessionManager(shared)
+(instancetype)sharedManager;{
    static AFHTTPSessionManager *_instnace;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        _instnace=[AFHTTPSessionManager manager];
//        配置请求类型，这个和服务器有关
        _instnace.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return _instnace;
}

@end
@implementation NHRequestManager
+(void)GET:(NSString *)URLString parameters:(id)parameters responseSeializerType:(NHResponseSeializerType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager *message=[AFHTTPSessionManager sharedManager];
    [message.requestSerializer setValue:[self cookie] forHTTPHeaderField:@"cookie"];
    if (type!=NHResponseSeializerTypeJSON&& type!=NHResponseSeializerTypeDefault) {
        message.responseSerializer=[self responseSearalizerWithSerilizerType:type];
    }
    [message GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 成功
        if (success) {
            success(responseObject);
        }
        //        NSLog(@"%@", responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 失败
        if (failure) {
            failure(error);
        }
        
    }];
}

// POST请求
+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
responseSeializerType:(NHResponseSeializerType)type
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    // 请求头
    [manager.requestSerializer setValue:[self cookie] forHTTPHeaderField:@"Authorization"];
    
    // 如果不是JSON 或者 不是Default 才设置解析器类型
    if (type != NHResponseSeializerTypeJSON && type != NHResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    //  https证书设置
    
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    policy.allowInvalidCertificates = YES;
    manager.securityPolicy  = policy;
    
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(responseObject);
        }
        NSLog(@"%@", responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //        [MBProgressHUD hideAllHUDsInView:nil];
        //
        //        [MBProgressHUD showMessage:@"网络失败~请重新再试" toView:nil];
        // 失败
        if (failure) {
            failure(error);
        }
    }];
}

// POST请求 上传数据
+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
responseSeializerType:(NHResponseSeializerType)type
constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    // 请求头
    //    NSString *value = [NSString stringWithFormat:@"Bearer %@",[ CommonTool validStringWithObj:kUserInfo[@"token"]]];
    //    if (value) {
    //        [manager.requestSerializer setValue:value forHTTPHeaderField:@"Authorization"];
    //    }
    // 如果不是JSON 或者 不是Default 才设置解析器类型
    if (type != NHResponseSeializerTypeJSON && type != NHResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    // https证书设置
    /*
     AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
     policy.allowInvalidCertificates = YES;
     manager.securityPolicy  = policy;
     */
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (block) {
            block(formData);
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //        [MBProgressHUD showMessage:@"网络出错" toView:[UIApplication sharedApplication].keyWindow];
        NSLog(@"%@", error);
        if (failure) {
            failure(error);
        }
        
    }];
}

/**
 *  设置数据解析器类型
 *  @param manager       请求管理类
 *  @param serilizerType 数据解析器类型
 */
+ (AFHTTPResponseSerializer *)responseSearalizerWithSerilizerType:(NHResponseSeializerType)serilizerType {
    
    switch (serilizerType) {
            
        case NHResponseSeializerTypeDefault: // default is JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeJSON: // JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeXML: // XML
            return [AFXMLParserResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypePlist: // Plist
            return [AFPropertyListResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeCompound: // Compound
            return [AFCompoundResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeImage: // Image
            return [AFImageResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeData: // Data
            return [AFHTTPResponseSerializer serializer];
            break;
            
        default:  // 默认解析器为 JSON解析
            return [AFJSONResponseSerializer serializer];
            break;
    }
}
+ (void)cancelAllRequests {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    [manager.operationQueue cancelAllOperations];
}

+(NSString*)cookie {
    return @"_ga=GA1.2.732729183.1467731127; install_id=5316804410; login_flag=319157cead347271ef233ba429923e3b; qh[360]=1; sessionid=b391787a2cd16be0f914259f0cf829a4; sid_guard=\"b391787a2cd16be0f914259f0cf829a4|1473218826|2591916|Fri\054 07-Oct-2016 03:25:42 GMT\"; sid_tt=b391787a2cd16be0f914259f0cf829a4; uuid=\"w:9ce15113cb34468795d7aff3edddd670";
}

@end
