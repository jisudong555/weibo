//
//  SDNavigationController.m
//  weibo
//
//  Created by jisudong on 15/11/13.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDNavigationController.h"

@interface SDNavigationController ()

@end

@implementation SDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{
    [self setupNavigationTheme];
    [self setupBarButtonItemTheme];
}

+ (void)setupNavigationTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    if (!iOS7) {
        [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
    
    NSMutableDictionary *navigationAttrs = [NSMutableDictionary dictionary];
    navigationAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    navigationAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
//    navigationAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
//    NSShadow *shadow = [[NSShadow alloc] init];
//    shadow.shadowOffset = CGSizeMake(0, 0);
//    navigationAttrs[NSShadowAttributeName] = shadow;
    [appearance setTitleTextAttributes:navigationAttrs];
}

+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    NSMutableDictionary *normal = [NSMutableDictionary dictionary];
    normal[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    normal[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    normal[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:normal forState:UIControlStateNormal];
    
    NSMutableDictionary *highlight = [NSMutableDictionary dictionaryWithDictionary:normal];
    highlight[NSForegroundColorAttributeName] = [UIColor redColor];
    [appearance setTitleTextAttributes:highlight forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disable = [NSMutableDictionary dictionaryWithDictionary:normal];
    disable[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disable forState:UIControlStateDisabled];
    
    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {// 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_back" highlightImage:@"navigationbar_back_highlighted" target:viewController action:@selector(back)];
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_more" highlightImage:@"navigationbar_more_highlighted" target:viewController action:@selector(more)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

@end
