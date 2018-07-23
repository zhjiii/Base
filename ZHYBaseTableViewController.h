//
//  ZHYBaseTableViewController.h
//  ZHYFramework
//
//  Created by apple on 16/5/28.
//  Copyright © 2016年 ZhouYuan. All rights reserved.
//

#import "ZHYBaseViewController.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface ZHYBaseTableViewController : ZHYBaseViewController <UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataSource;

/**
 *  必须在init函数里面初始化才有效果
 */
@property (assign, nonatomic) UITableViewStyle tableViewStyle;


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath __attribute__((objc_requires_super)) ;

- (NSString *)showEmptyDate;

@end
