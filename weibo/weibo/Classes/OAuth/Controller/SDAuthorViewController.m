//
//  SDAuthorViewController.m
//  weibo
//
//  Created by jisudong on 15/12/16.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDAuthorViewController.h"
#import "MBProgressHUD+SD.h"
#import <AFNetworking/AFNetworking.h>
#import "SDAccount.h"
#import "SDAccountTool.h"
#import "SDControllerTool.h"

@interface SDAuthorViewController () <UIWebViewDelegate>

@end

@implementation SDAuthorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=1789528428&redirect_uri=https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    webView.delegate = self;
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载中..."];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString *url = request.URL.absoluteString;
    NSRange range = [url rangeOfString:@"https://www.baidu.com/?code="];
    if (range.location != NSNotFound) {
        NSInteger from = range.location + range.length;
        NSString *code = [url substringFromIndex:from];
        [self accessTokenWithCode:code];
        [MBProgressHUD hideHUD];
        return NO;
    }
    return YES;
}

/**
 *  用授权的请求标记code 换取accessToken
 *
 *  @param code 授权的请求标记
 */
- (void)accessTokenWithCode:(NSString *)code
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    
    NSMutableDictionary *paremeter = [NSMutableDictionary dictionary];
    paremeter[@"client_id"] = @"1789528428";
    paremeter[@"client_secret"] = @"7265ab6775b4a55d63a5e6b06cd2119a";
    paremeter[@"grant_type"] = @"authorization_code";
    paremeter[@"code"] = code;
    paremeter[@"redirect_uri"] = @"https://www.baidu.com";
   
    
    [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:paremeter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        SDLog(@"%@", responseObject);
        [MBProgressHUD hideHUD];
        SDAccount *account = [SDAccount accountWithDict:responseObject];
        [SDAccountTool saveAccount:account];
        [SDControllerTool chooseRootViewController];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        [MBProgressHUD hideHUD];
        SDLog(@"%@", error);
    }];
}

@end
