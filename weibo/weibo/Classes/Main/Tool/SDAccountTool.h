//
//  SDAccountTool.h
//  weibo
//
//  Created by jisudong on 15/12/18.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SDAccount;

@interface SDAccountTool : NSObject

/**
 *  保存账号信息
 */
+ (void)saveAccount:(SDAccount *)account;

/**
 *  读取账号信息
 */
+ (SDAccount *)readAccount;

@end
