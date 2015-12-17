//
//  SDAccountTool.m
//  weibo
//
//  Created by jisudong on 15/12/18.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDAccountTool.h"
#import "SDAccount.h"

#define SDAccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation SDAccountTool

+ (void)saveAccount:(SDAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:SDAccountFilepath];
}

+ (SDAccount *)readAccount
{
    SDAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:SDAccountFilepath];
    NSDate *now = [NSDate date];
    if ([now compare:account.expires_time] != NSOrderedAscending) {
        account = nil;
    }
    return account;
}

@end
