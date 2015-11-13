//
//  SDTabBarViewController.m
//  weibo
//
//  Created by jisudong on 15/11/12.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDTabBarViewController.h"
#import "SDHomeViewController.h"
#import "SDMessageViewController.h"
#import "SDDiscoverViewController.h"
#import "SDProfileViewController.h"
#import "SDNavigationController.h"

@interface SDTabBarViewController ()

@end

@implementation SDTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SDHomeViewController *home = [[SDHomeViewController alloc] init];
    [self addOneChildVc:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    SDMessageViewController *message = [[SDMessageViewController alloc] init];
    [self addOneChildVc:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    SDDiscoverViewController *discover = [[SDDiscoverViewController alloc] init];
    [self addOneChildVc:discover title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    SDProfileViewController *profile = [[SDProfileViewController alloc] init];
    [self addOneChildVc:profile title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.view.backgroundColor = SDRandomColor;
    //设置标题 childVc.title 等价于 childVc.tabBarItem.title = title 和 childVc.navigationItem.title = title
    childVc.title = title;
    //设置普通标题颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //设置选中标题颜色
    NSMutableDictionary *textAttrsSelected = [NSMutableDictionary dictionary];
    textAttrsSelected[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrsSelected forState:UIControlStateSelected];
    //设置普通图片
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    //设置选中图片
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    
    SDNavigationController *nav = [[SDNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
