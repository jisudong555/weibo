//
//  SDTabBar.m
//  weibo
//
//  Created by jisudong on 15/12/13.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDTabBar.h"

@interface SDTabBar ()

@property (nonatomic, strong) UIButton *plusButton;

@end

@implementation SDTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        if (!iOS7) {
            self.backgroundImage = [UIImage imageWithName:@"tabbar_background"];
            
        }
        self.selectionIndicatorImage = [UIImage imageWithName:@"navigationbar_button_background"];
        
        [self setupPlusButton];
    }
    return self;
}

- (void)setupPlusButton
{
    UIButton *plusButton = [[UIButton alloc] init];
    [plusButton setBackgroundImage:[UIImage imageWithName:@""] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageWithName:@""] forState:UIControlStateHighlighted];
    
    [plusButton setImage:[UIImage imageWithName:@""] forState:UIControlStateNormal];
    [plusButton setImage:[UIImage imageWithName:@""] forState:UIControlStateHighlighted];
    
    [plusButton addTarget:self action:@selector(plusButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:plusButton];
    self.plusButton = plusButton;
}

- (void)plusButtonClick:(UIButton *)button
{
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]) {
        [self.tabBarDelegate tabBarDidClickedPlusButton:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupPlusButtonFrame];
    
    [self setupAllTabBarButtonFrame];
}

- (void)setupPlusButtonFrame
{
    self.plusButton.size = self.plusButton.currentBackgroundImage.size;
    self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

- (void)setupAllTabBarButtonFrame
{
    int index = 0;
    for (UIView *tabBarButton in self.subviews) {
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        
        [self setupTabBarButtonFrame:tabBarButton atIndex:index];
        index++;
    }
}

- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    CGFloat buttonW = self.width / (self.items.count + 1);
    CGFloat buttonH = self.height;
    
    tabBarButton.width = buttonW;
    tabBarButton.height = buttonH;
    if (index >= 2) {
        tabBarButton.x = buttonW * (index + 1);
    } else {
        tabBarButton.x = buttonW * index;
    }
    tabBarButton.y = 0;
}

@end
