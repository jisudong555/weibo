//
//  SDAccount.h
//  weibo
//
//  Created by jisudong on 15/12/18.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDAccount : NSObject <NSCoding>

/**	string	用于调用access_token，接口获取授权后的access token。*/
@property (nonatomic, copy) NSString *access_token;
/**	string	access_token的生命周期，单位是秒数。*/
@property (nonatomic, copy) NSString *expires_in;
/**	string	当前授权用户的UID。*/
@property (nonatomic, copy) NSString *uid;
/** 过期时间 */
@property (nonatomic, strong) NSDate *expires_time;

+ (instancetype)accountWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
