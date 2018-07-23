//
//  NSObject+ProgressHUD.m
//  BMZY-YS
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 ZhouYuan. All rights reserved.
//

#import "NSObject+ProgressHUD.h"
#import "MBProgressHUD.h"
#import <AVOSCloud/AVOSCloud.h>
#import "LeanChatLib.h"

@implementation NSObject (ProgressHUD)

#pragma mark - util

- (void)alert:(NSString*)msg {
    UIAlertView *alertView=[[UIAlertView alloc]
                            initWithTitle:nil message:msg delegate:nil
                            cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

- (BOOL)alertError:(NSError *)error {
    if (error) {
        if (error.code == kAVIMErrorConnectionLost) {
            [self alert:@"未能连接聊天服务"];
        }
        else if ([error.domain isEqualToString:NSURLErrorDomain]) {
            [self alert:@"网络连接发生错误"];
        }
        else {
#ifndef DEBUG
            [self alert:[NSString stringWithFormat:@"%@", error]];
#else
            NSString *info = error.localizedDescription;
            [self alert:info ? info : [NSString stringWithFormat:@"%@", error]];
#endif
        }
        return YES;
    }
    return NO;
}

- (BOOL)filterError:(NSError *)error {
    return [self alertError:error] == NO;
}

-(void)showNetworkIndicator{
    UIApplication *app=[UIApplication sharedApplication];
    app.networkActivityIndicatorVisible=YES;
}

-(void)hideNetworkIndicator{
    UIApplication *app=[UIApplication sharedApplication];
    app.networkActivityIndicatorVisible=NO;
}

-(void)showProgress {
    [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
}

-(void)hideProgress {
    [MBProgressHUD hideHUDForView:kKeyWindow animated:YES];
}


- (void)toast:(NSString *)text {
    [self toast:text duration:2];
}

- (void)toast:(NSString *)text duration:(NSTimeInterval)duration {
    //[AVAnalytics event:@"toast" attributes:@{@"text": text}];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
    //    hud.labelText=text;
    hud.detailsLabelFont = [UIFont systemFontOfSize:14];
    hud.detailsLabelText = text;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:duration];
}

-(void)showHUDText:(NSString*)text{
    [self toast:text];
}

-(void)runInMainQueue:(void (^)())queue{
    dispatch_async(dispatch_get_main_queue(), queue);
}

-(void)runInGlobalQueue:(void (^)())queue{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), queue);
}

-(void)runAfterSecs:(float)secs block:(void (^)())block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, secs*NSEC_PER_SEC), dispatch_get_main_queue(), block);
}


@end
