//
//  SDControllerTool.m
//  weibo
//
//  Created by jisudong on 15/12/18.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDControllerTool.h"
#import "SDTabBarViewController.h"
#import "SDNewfeatureViewController.h"

@implementation SDControllerTool

+ (void)chooseRootViewController
{
    NSString *localVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"CFBundleVersion"];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    // @"CFBundleVersion" == (__bridge NSString *)kCFBundleVersionKey
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if ([localVersion isEqualToString:currentVersion]) {
        window.rootViewController = [[SDTabBarViewController alloc] init];
    } else {
        window.rootViewController = [[SDNewfeatureViewController alloc] init];
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"CFBundleVersion"];
        // 立即同步 （如果不立即同步，系统会随机找个时间同步）
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
