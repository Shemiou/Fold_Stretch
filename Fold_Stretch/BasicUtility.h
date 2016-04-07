//
//  DMUtility.h
//  MeeLive
//
//  Created by dm on 14/11/19.
//  Copyright (c) 2014年 duomi. All rights reserved.
//

#import <CoreText/CoreText.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define RatioWidth [UIScreen mainScreen].bounds.size.width / 320.0
#define RatioHeight [UIScreen mainScreen].bounds.size.height / 568.0

#define DescLabelWidth (296.0 * RatioWidth)
#define SpaceHeight (36.0 * RatioHeight)
#define DescLabelHeight (27.0 * RatioHeight)
#define MoreBtnToCenter (160 * RatioWidth)

#define TOPIC @"话题"

@interface BasicUtility : NSObject

+ (UInt64)getNowMillisecond;
+ (CGSize)returnLabelSizeWithLabel:(UILabel *)label
                      maxSizeWidth:(CGFloat)sizeWidth
                              text:(NSString *)text;

+ (CGSize)returnLabelSizeWithFont:(UIFont *)font
                     maxSizeWidth:(CGFloat)sizeWidth
                             text:(NSString *)text;

+ (CGSize)returnLabelWidthWithFont:(UIFont *)font
                     maxSizeHeight:(CGFloat)sizeHeight
                              text:(NSString *)text;

+ (UIImage *)createImageWithColor:(UIColor *)color;

/**
 *  计算label中的数字
 *
 */
+ (NSArray *)getSeparatedLinesFromLabelText:(NSString *)text
                                 labelWidth:(CGFloat)width
                                  labelFont:(UIFont *)font;

@end
