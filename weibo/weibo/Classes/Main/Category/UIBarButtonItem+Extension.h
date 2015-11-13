//
//  UIBarButtonItem+Extension.h
//  weibo
//
//  Created by jisudong on 15/11/13.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)imageName highlightImage:(NSString *)highlightImageName target:(id)target action:(SEL)action;

@end
