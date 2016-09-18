//
//  ZHYTabBarControllerConfig.m
//  ZHYFramework
//
//  Created by apple on 16/5/28.
//  Copyright © 2016年 ZhouYuan. All rights reserved.
//

#import "ZHYTabBarControllerConfig.h"
#import "HomePageViewCongtroller.h"
#import "MessagesTableViewController.h"
#import "PatiensTableViewController.h"
#import "DoctorsTableViewController.h"
#import "PersonalCenterTableViewController.h"
#import "ZHYBaseNavigationController.h"
#import <ChameleonFramework/Chameleon.h>

@interface ZHYTabBarControllerConfig()

@property (strong, nonatomic, readwrite) UITabBarController *tabBarController;

@end


@implementation ZHYTabBarControllerConfig


#pragma mark - get & set

- (UITabBarController *)tabBarController{
    if (!_tabBarController) {
        _tabBarController = [[UITabBarController alloc] init];
        _tabBarController.tabBar.tintColor = [UIColor flatGreenColorDark];
        
        HomePageViewCongtroller *vc1 = [[HomePageViewCongtroller alloc] init];
        ZHYBaseNavigationController *nc1 = [[ZHYBaseNavigationController alloc] initWithRootViewController:vc1];
        nc1.tabBarItem.title = @"首页";
        nc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_homePage"];

        MessagesTableViewController *vc2 = [[MessagesTableViewController alloc] init];
        ZHYBaseNavigationController *nc2 = [[ZHYBaseNavigationController alloc] initWithRootViewController:vc2];
        nc2.tabBarItem.title = @"消息";
        nc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_message"];

        PatiensTableViewController *vc3 = [[PatiensTableViewController alloc] init];
        ZHYBaseNavigationController *nc3 = [[ZHYBaseNavigationController alloc] initWithRootViewController:vc3];
        nc3.tabBarItem.title = @"患者";
        nc3.tabBarItem.image = [UIImage imageNamed:@"tabbar_patient"];

        DoctorsTableViewController *vc4 = [[DoctorsTableViewController alloc] init];
        ZHYBaseNavigationController *nc4 = [[ZHYBaseNavigationController alloc] initWithRootViewController:vc4];
        nc4.tabBarItem.title = @"医圈";
        nc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_doctor"];

        
        PersonalCenterTableViewController  *vc5 = [[PersonalCenterTableViewController alloc] init];
        ZHYBaseNavigationController *nc5 = [[ZHYBaseNavigationController alloc] initWithRootViewController:vc5];
        nc5.tabBarItem.title = @"个人中心";
        nc5.tabBarItem.image = [UIImage imageNamed:@"tabbar_personalCenter"];
        [_tabBarController setViewControllers:@[nc1, nc2, nc3, nc4, nc5]];

        //[self setUpTabBarItemBadgesForControllers:@[vc3,vc4]];
    }
    return _tabBarController;
}

- (void)setUpTabBarItemBadgesForControllers:(NSArray<UIViewController *> *)viewControllers {
    for (UIViewController *viewController in viewControllers) {
        if ([viewController respondsToSelector:@selector(refresh)]) {
            [viewController performSelector:@selector(refresh)];
        }
    }
}


@end
