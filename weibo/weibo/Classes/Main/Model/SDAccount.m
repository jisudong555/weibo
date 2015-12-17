//
//  SDAccount.m
//  weibo
//
//  Created by jisudong on 15/12/18.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDAccount.h"

@implementation SDAccount

+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
//        self.access_token = dict[@"access_token"];
//        self.expires_in = dict[@"expires_in"];
//        self.uid = dict[@"uid"];
        
        // 这样写比上面写法安全，
        self.access_token = [dict valueForKeyPath:@"access_token"];
        self.expires_in = [dict valueForKeyPath:@"expires_in"];
        self.uid = [dict valueForKeyPath:@"uid"];
        
        NSDate *now = [NSDate date];
        self.expires_time = [now dateByAddingTimeInterval:self.expires_in.doubleValue];
        
    }
    return self;
}

/**
 *  从文件中解析一个对象时调用
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.expires_time = [aDecoder decodeObjectForKey:@"expires_time"];
    }
    return self;
}

/**
 *  将一个对象存到文件时调用
 *
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.expires_time forKey:@"expires_time"];
}


@end
