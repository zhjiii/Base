//
// Created by apple on 16/6/13.
// Copyright (c) 2016 ZhouYuan. All rights reserved.
//

#import <JSBadgeView/JSBadgeView.h>
#import "ZHYBaseTableViewCell.h"


@interface ZHYBaseTableViewCell ()

@property (strong, nonatomic) NSDictionary *dictionary;

@end

@implementation ZHYBaseTableViewCell

- (instancetype)initWithTableView:(UITableView *)tableView  dataSource:(NSDictionary *)dictionary{
    self.dictionary = dictionary;
    NSString *detail = dictionary[kMutipleSectionDetailKey];
    NSString *subtitle = dictionary[kMutipleSectionSubtitleKey];
    NSString *title = dictionary[kMutipleSectionTitleKey];
    UIImage *image = dictionary[kMutipleSectionImageKey];
    NSInteger badge = [dictionary[kMutipleSectionBadgeKey] intValue];
    UITableViewCellStyle myStyle;
    if (detail) {
        myStyle = UITableViewCellStyleValue1;
    } else if (subtitle) {
        myStyle = UITableViewCellStyleSubtitle;
    } else {
        myStyle = UITableViewCellStyleDefault;
    }
    
    static NSString *cellIdentifier = @"ZHYBaseTableViewCell";
    self = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!self){
        self = [[ZHYBaseTableViewCell alloc] initWithStyle:myStyle reuseIdentifier:cellIdentifier];
    }

    if (title) {
        self.textLabel.text = title;
    }

    if (subtitle) {
        self.detailTextLabel.text = subtitle;
    }

    if (detail) {
        self.detailTextLabel.text = detail;
    }

    if (image) {
        self.imageView.image = image;
    }

    NSUInteger badgeViewTag = 120;

    JSBadgeView *badgeView = (JSBadgeView *)[self viewWithTag:badgeViewTag];
    if (badge > 0) {
        if (badgeView == nil) {
            badgeView = [[JSBadgeView alloc] initWithParentView:self.textLabel alignment:JSBadgeViewAlignmentCenterRight];
            badgeView.tag = badgeViewTag;
        }
        badgeView.badgeText = [NSString stringWithFormat:@"%ld", (long)badge];
    } else {
        if (badgeView) {
            [badgeView removeFromSuperview];
        }
    }

    if (dictionary[kMutipleSectionSelectorKey]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    BOOL logout = [dictionary[kMutipleSectionLogoutKey] boolValue];
    if (logout) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.textColor = [UIColor whiteColor];
        self.backgroundColor = UIBaseColor;
    }
    else {
        self.textLabel.textAlignment = NSTextAlignmentLeft;
        self.backgroundColor = [UIColor whiteColor];
        self.textLabel.textColor = [UIColor blackColor];
    }

    id discloure = dictionary[kMutipleSectionDiscloureKey];
    if (discloure) {
        BOOL discloureValue = [discloure boolValue];
        if (discloureValue) {
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            self.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    return self;
}

- (UITableViewCellStyle)tableViewCellStyle{
    NSString *subtitle = self.dictionary[kMutipleSectionSubtitleKey];
    NSString *detail = self.dictionary[kMutipleSectionDetailKey];
    if (detail) {
        return UITableViewCellStyleValue1;
    } else if (subtitle) {
        return UITableViewCellStyleSubtitle;
    } else {
        return UITableViewCellStyleDefault;
    }
}

@end
