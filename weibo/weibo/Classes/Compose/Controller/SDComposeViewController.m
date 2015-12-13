//
//  SDComposeViewController.m
//  weibo
//
//  Created by jisudong on 15/12/13.
//  Copyright © 2015年 jisudong. All rights reserved.
//

#import "SDComposeViewController.h"

@implementation SDComposeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"发微博";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发微博" style:UIBarButtonItemStyleBordered target:self action:@selector(send)];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)send
{
    
}

@end
