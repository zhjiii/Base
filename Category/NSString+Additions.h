//
//  NSString+Additions.h
//  BMZY-YS
//
//  Created by apple on 2017/8/21.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface NSString (Additions)

- (CGSize)sizeWithConstrainedToWidth:(float)width fromFont:(UIFont *)font1 lineSpace:(float)lineSpace;



/**
 绘制文字

 @param context 上下文
 @param p 起始点
 @param font 字体
 @param color 颜色
 @param height 最大高度
 */
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height;


@end
