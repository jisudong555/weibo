//
//  SDAuthorViewController.m
//  weibo
//
//  Created by jisudong on 15/12/16.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDAuthorViewController.h"
#import "MBProgressHUD+SD.h"

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
    
    SDLog(@"%@", request.URL.absoluteString);
    return YES;
}

@end
