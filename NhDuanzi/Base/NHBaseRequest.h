//
//  NHBaseRequest.h
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/27.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import <Foundation/Foundation.h>
//声明接口
@protocol NHBaseRequestResponseDelegate <NSObject>
@required
-(void)requestSuccessResponse:(BOOL)success response:(id)response message:(id)message;

@end
//吧block弄成变量玩，该方法为回调
typedef void(^NHAPIDicCompletion)(id response,BOOL success,NSString *message);

@interface NHBaseRequest : NSObject
//代理用weak修饰
@property(nonatomic,weak)id<NHBaseRequestResponseDelegate>nh_delegate;
@property(nonatomic,copy)NSString *nh_url;
@property(nonatomic,assign)BOOL nh_isPost;
//用image修饰数组里的都为image
@property(nonatomic,strong)NSArray <UIImage *>*nh_imageArray;

+(instancetype)nh_request;
+(instancetype)nh_requestWitnUrl:(NSString*)url;
+(instancetype)nh_requestWitnUrl:(NSString*)url isPost:(BOOL)isPost;
//把接口放到方法中去，返回需要属性
+(instancetype)nh_requestWitnUrl:(NSString *)url isPost:(BOOL)isPost delegate:(id <NHBaseRequestResponseDelegate>)nh_delegate;
/**
 *  开始请求设置了代理不需要回调
 */
-(void)nh_sendRequese;
/**
 回调优先级大于代理
 */
-(void)nh_sendRequeseWithCompletion:(NHAPIDicCompletion)completion;

@end
