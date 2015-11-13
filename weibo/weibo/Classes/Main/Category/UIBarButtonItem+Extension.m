//
//  UIBarButtonItem+Extension.m
//  weibo
//
//  Created by jisudong on 15/11/13.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)imageName highlightImage:(NSString *)highlightImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    
    [button setBackgroundImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:highlightImageName] forState:UIControlStateHighlighted];
    
    //设置button的尺寸
    button.size = button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
