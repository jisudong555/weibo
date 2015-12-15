//
//  MBProgressHUD+SD.h
//  Pods
//
//  Created by jisudong on 15/12/16.
//
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (SD)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
