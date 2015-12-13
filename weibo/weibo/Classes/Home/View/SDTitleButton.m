//
//  SDTitleButton.m
//  weibo
//
//  Created by jisudong on 15/11/16.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDTitleButton.h"

@implementation SDTitleButton


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.font = SDNavigationTitleFont;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = self.height;
    CGFloat imageH = imageW;
    CGFloat imageY = 0;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleH = self.height;
    CGFloat titleW = self.width - titleH;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
