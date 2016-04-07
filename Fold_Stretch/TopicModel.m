//
//  TopicModel.m
//  Fold_Stretch
//
//  Created by Charles Wang on 16/3/29.
//  Copyright © 2016年 MeeLive. All rights reserved.
//

#import "BasicUtility.h"
#import "TopicModel.h"

@implementation TopicModel

- (instancetype)init {
  self = [super init];
  if (self) {
    _showMore = NO;
  }
  return self;
}

- (CGFloat)DescriptionHeight {
  UIFont *font = [UIFont systemFontOfSize:17.0];

  if (self.desc.length <= 0) {
    return SpaceHeight;
  }

  NSArray *textArray = [[NSArray alloc]
      initWithArray:[BasicUtility getSeparatedLinesFromLabelText:self.desc
                                                      labelWidth:DescLabelWidth
                                                       labelFont:font]];

  CGFloat descriptionHeight = SpaceHeight;

  if (textArray.count == 1) {
    descriptionHeight += [self textOneLine].height;
  }
  if (textArray.count == 2) {
    return descriptionHeight += [self textOneLine].height * 2;
  }
  if (textArray.count > 2) {
    if (_showMore) {
      descriptionHeight += [self moreShowThanTwoLine:textArray font:font];
    } else {
      descriptionHeight += [self textOneLine].height * 2;
    }
  }

  return descriptionHeight;
}

- (CGFloat)moreShowThanTwoLine:(NSArray *)textArray font:(UIFont *)font {
  if (textArray.count > 2) {
    NSString *string =
        [NSString stringWithFormat:@"%@%@%@", textArray[0], textArray[1],
                                   [self moreShow]];
    CGSize textSize =
        [BasicUtility returnLabelSizeWithFont:font
                                 maxSizeWidth:(DescLabelWidth - 12)
                                         text:string];

    if (textSize.height > [self textOneLine].height * textArray.count) {
      return [self textOneLine].height * (textArray.count + 1);
    }
  }
  return [self textOneLine].height * textArray.count;
}

- (NSString *)moreShow {
  if (self.showMore) {
    return @"[更多]";
  } else {
    return @"[收起]";
  }
}

- (CGSize)textOneLine {
  CGSize size =
      [BasicUtility returnLabelSizeWithFont:[UIFont systemFontOfSize:17.0]
                               maxSizeWidth:CGFLOAT_MAX
                                       text:TOPIC];
  return size;
}

@end
