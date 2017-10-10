//
//  UILabel+BackgroundColor.m
//  BMZY-YS
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "UILabel+BackgroundColor.h"
#import <objc/message.h>

@implementation UILabel (BackgroundColor)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(initWithFrame:);
        SEL swizzledSelector = @selector(zhy_initWithFrame:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (UILabel *)zhy_initWithFrame:(BOOL)animated {
    UILabel *label = [self zhy_initWithFrame:animated];
    [label setBackgroundColor:[UIColor whiteColor]];
    label.clipsToBounds = YES;
    return label;
}
@end
