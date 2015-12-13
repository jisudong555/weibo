//
//  SDPopMenu.m
//  weibo
//
//  Created by jisudong on 15/11/16.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDPopMenu.h"

@interface SDPopMenu ()
@property (strong, nonatomic) UIView *contentView;
@property (nonatomic, weak) UIButton *cover;//背景覆盖
@property (nonatomic, weak) UIImageView *container;

@end

@implementation SDPopMenu

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        UIImageView *container = [[UIImageView alloc] init];
        container.userInteractionEnabled = YES;
        container.image = [UIImage resizeImage:@"popover_background"];
        [self addSubview:container];
        self.container = container;
    }
    return self;
}

- (instancetype)initWithContentView:(UIView *)contentView
{
    if (self = [super init]) {
        self.contentView = contentView;
    }
    return self;
}

+ (instancetype)popMenuWithContentView:(UIView *)contentView
{
    return [[self alloc] initWithContentView:contentView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.cover.frame = self.bounds;
}

#pragma mark - 公共方法
- (void)setbackground:(UIImage *)background
{
    self.container.image = background;
}

- (void)showInRect:(CGRect)rect
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    self.container.frame = rect;
    [self.container addSubview:self.contentView];
    
    CGFloat marginTop = 12;
    CGFloat marginBottom = 8;
    CGFloat marginLeft = 5;
    CGFloat marginRight = 5;
    
    self.contentView.y = marginTop;
    self.contentView.x = marginLeft;
    self.contentView.width = self.container.width - marginLeft - marginRight;
    self.contentView.height = self.container.height - marginTop - marginBottom;
}

- (void)dismiss
{
    if ([self.delegate respondsToSelector:@selector(popMenuDidDismissed:)]) {
        [self.delegate popMenuDidDismissed:self];
    }
    [self removeFromSuperview];
}

@end
