//
//  SDTabBar.h
//  weibo
//
//  Created by jisudong on 15/12/13.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDTabBar;

@protocol SDTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedPlusButton:(SDTabBar *)tabBar;

@end

@interface SDTabBar : UITabBar

@property (nonatomic, weak) id <SDTabBarDelegate> tabBarDelegate;

@end
