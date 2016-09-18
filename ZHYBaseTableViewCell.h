//
// Created by apple on 16/6/13.
// Copyright (c) 2016 ZhouYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *kMutipleSectionImageKey = @"image";
static NSString *kMutipleSectionTitleKey = @"title";
static NSString *kMutipleSectionSubtitleKey = @"subtitle";
static NSString *kMutipleSectionDetailKey = @"detail";
static NSString *kMutipleSectionBadgeKey = @"badge";
static NSString *kMutipleSectionLogoutKey = @"logout";
static NSString *kMutipleSectionDiscloureKey = @"discloure";
static NSString *kMutipleSectionSelectorKey = @"selector";

@interface ZHYBaseTableViewCell : UITableViewCell

- (instancetype)initWithTableView:(UITableView *)tableView  dataSource:(NSDictionary *)dictionary;

@end