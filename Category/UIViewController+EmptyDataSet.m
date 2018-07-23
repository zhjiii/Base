//
//  UIViewController+EmptyDataSet.m
//  BMZY-YS
//
//  Created by apple on 16/12/1.
//  Copyright © 2016年 ZhouYuan. All rights reserved.
//

#import "UIViewController+EmptyDataSet.h"
#import <Aspects/Aspects.h>

@implementation UIViewController (EmptyDataSet)

+ (void)load{
    
    
//    [self aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo){
//        UITableViewController *vc = [aspectInfo instance];
//        
//        //设置空数据的背景
//        vc.tableView.emptyDataSetDelegate = vc;
//        vc.tableView.emptyDataSetSource = vc;
//        
//        //取消多余的cell
//        vc.tableView.tableFooterView = [UIView new];
//        
//        vc.tableView.backgroundColor = UIColorFromRGB(0xF5F5F5);
//        vc.tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
//        
//        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
//        
//    } error:NULL];

}

#pragma mark - DZNEmptyDataSetDelegate DZNEmptyDataSetSource

/**
 *  当tableView没有数据时显示的背景，DZNEmptyDataSet
 *  @param scrollView
 *  @return 返回要在背景里面显示的字符串
 */
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = @"暂时没有数据";
    if ([NSStringFromClass([self class]) isEqualToString:@"RepairProgressTableViewController"]) {
        text = @"服务单还没有分派工程师";
    }
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
}


@end
