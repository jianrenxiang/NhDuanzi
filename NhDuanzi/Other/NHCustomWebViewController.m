//
//  NHCustomWebViewController.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/10/28.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHCustomWebViewController.h"
#import <WebKit/WebKit.h>
@interface NHCustomWebViewController ()<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic, weak) WKWebView *webView;
@property (nonatomic, copy) NSString *url;
@end

@implementation NHCustomWebViewController

- (instancetype)initWithUrl:(NSString *)url {
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *URL = [NSURL URLWithString:[self.url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:self.url]]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:URL]];
}
- (WKWebView *)webView {
    if (!_webView) {
        WKWebView *wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
        [self.view addSubview:wkWebView];
        _webView = wkWebView;
        wkWebView.UIDelegate = self;
        wkWebView.navigationDelegate = self;
        wkWebView.opaque = NO;
        wkWebView.backgroundColor = self.view.backgroundColor;
    }
    return _webView;
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
    // 允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    // 允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)pop {
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        
        if ([self.webView canGoBack]) {
            [self.webView goBack];
        } else  {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    
}

@end
