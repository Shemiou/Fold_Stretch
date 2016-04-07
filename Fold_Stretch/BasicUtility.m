//
//  DMUtility.m
//  MeeLive
//
//  Created by dm on 14/11/19.
//  Copyright (c) 2014年 duomi. All rights reserved.
//

#import "BasicUtility.h"

@implementation BasicUtility
+ (UInt64)getNowMillisecond {
  return [[NSDate date] timeIntervalSince1970] * 1000;
}

+ (CGSize)returnLabelSizeWithFont:(UIFont *)font
                     maxSizeWidth:(CGFloat)sizeWidth
                             text:(NSString *)text {
  if (!font) {
    return CGSizeZero;
  }
  CGRect rect =
      [text boundingRectWithSize:CGSizeMake(sizeWidth, CGFLOAT_MAX)
                         options:NSStringDrawingUsesLineFragmentOrigin |
                                 NSStringDrawingUsesFontLeading
                      attributes:@{
                        NSFontAttributeName : font
                      }
                         context:nil];
  return CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
}

+ (CGSize)returnLabelSizeWithLabel:(UILabel *)label
                      maxSizeWidth:(CGFloat)sizeWidth
                              text:(NSString *)text {
  CGRect rect =
      [text boundingRectWithSize:CGSizeMake(sizeWidth, CGFLOAT_MAX)
                         options:NSStringDrawingUsesLineFragmentOrigin |
                                 NSStringDrawingUsesFontLeading
                      attributes:@{
                        NSFontAttributeName : label.font
                      }
                         context:nil];
  return CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
}

+ (CGSize)returnLabelWidthWithFont:(UIFont *)font
                     maxSizeHeight:(CGFloat)sizeHeight
                              text:(NSString *)text {
  if (!font) {
    return CGSizeZero;
  }
  CGRect rect =
      [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, sizeHeight)
                         options:NSStringDrawingUsesLineFragmentOrigin |
                                 NSStringDrawingUsesFontLeading
                      attributes:@{
                        NSFontAttributeName : font
                      }
                         context:nil];
  return CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
}

+ (UIImage *)createImageWithColor:(UIColor *)color {
  CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(context, [color CGColor]);
  CGContextFillRect(context, rect);
  UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return theImage;
}

/**
 *  计算label中的数字
 *
 */
+ (NSArray *)getSeparatedLinesFromLabelText:(NSString *)text
                                 labelWidth:(CGFloat)width
                                  labelFont:(UIFont *)font {
  CTFontRef myFont = CTFontCreateWithName(
      (__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
  NSMutableAttributedString *attStr =
      [[NSMutableAttributedString alloc] initWithString:text];
  [attStr addAttribute:(NSString *)kCTFontAttributeName
                 value:(__bridge id)myFont
                 range:NSMakeRange(0, attStr.length)];

  CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(
      (__bridge CFAttributedStringRef)attStr);

  CGMutablePathRef path = CGPathCreateMutable();
  CGPathAddRect(path, NULL, CGRectMake(0, 0, width, CGFLOAT_MAX));

  CTFrameRef frame =
      CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);

  NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
  NSMutableArray *linesArray = [[NSMutableArray alloc] init];

  for (id line in lines) {
    CTLineRef lineRef = (__bridge CTLineRef)line;
    CFRange lineRange = CTLineGetStringRange(lineRef);
    NSRange range = NSMakeRange(lineRange.location, lineRange.length);

    NSString *lineString = [text substringWithRange:range];
    [linesArray addObject:lineString];
  }
  return (NSArray *)linesArray;
}

@end
