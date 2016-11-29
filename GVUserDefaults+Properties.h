//
//  GVUserDefaults+Properties.h
//  ZHYFramework
//
//  Created by apple on 16/5/28.
//  Copyright © 2016年 ZhouYuan. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>

@interface GVUserDefaults (Properties)


/**
 显示姓名
 */
@property (strong, nonatomic) NSString *userName;


@property (strong, nonatomic) NSString *userId;


/**
 头像
 */
@property (strong, nonatomic) NSString *avatar;


/**
 登录名
 */
@property (strong, nonatomic) NSString *userCode;


/**
 医生职称
 */
@property (strong, nonatomic) NSString *title;


/**
 职位
 */
@property (strong, nonatomic) NSString *position;


/**
 手机号
 */
@property (strong, nonatomic) NSString *mobileNum;


/**
 医生简介
 */
@property (strong, nonatomic) NSString *intro;



/**
 关注人数
 */
@property (strong, nonatomic) NSNumber *popularity;

@end
