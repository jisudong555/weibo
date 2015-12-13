//
//  SDPopMenu.h
//  weibo
//
//  Created by jisudong on 15/11/16.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDPopMenu;
@protocol SDPopMenuDelegate <NSObject>

@optional
- (void)popMenuDidDismissed:(SDPopMenu *)popMenu;

@end


@interface SDPopMenu : UIView

@property (nonatomic, weak) id <SDPopMenuDelegate> delegate;

//初始化方法
- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype)popMenuWithContentView:(UIView *)contentView;

//设置背景图片
- (void)setbackground:(UIImage *)background;
//显示菜单
- (void)showInRect:(CGRect)rect;
//关闭菜单
- (void)dismiss;

@end
