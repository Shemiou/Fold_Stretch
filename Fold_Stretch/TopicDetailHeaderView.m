//
//  TopicDetailHeaderView.m
//  inke
//
//  Created by Charles Wang on 16/3/10.
//  Copyright © 2016年 MeeLive. All rights reserved.
//

#import "BasicUtility.h"
#import "TopicDetailHeaderView.h"

@interface TopicDetailHeaderView () {
  CGFloat _desTextHeight;
  NSArray *_textArray;
}

@property(weak, nonatomic) IBOutlet NSLayoutConstraint *moreBtnToLeft;
@property(weak, nonatomic) IBOutlet NSLayoutConstraint *descLabelWidth;

@property(weak, nonatomic) IBOutlet UIButton *moreButton;
@property(weak, nonatomic) IBOutlet UILabel *descLabel;

@property(nonatomic, strong) NSString *describeText;

@property(nonatomic, strong) NSMutableArray *tickerData;

@end

@implementation TopicDetailHeaderView

- (void)awakeFromNib {
  [super awakeFromNib];

  [_moreButton setTitle:[self moreShow] forState:UIControlStateNormal];
  _moreButton.hidden = YES;

  _descLabel.text = nil;
  _showMore = NO;
  _descLabelWidth.constant = DescLabelWidth;
}

- (void)TopicDetailWithModel:(TopicModel *)model {
  if (!model) return;

  _model = model;
  _describeText = model.desc;
  [self _desLabelArray];
}

- (void)_desLabelArray {
  _descLabel.text = nil;
  _moreButton.hidden = YES;
  UIFont *font = [UIFont systemFontOfSize:17.0];
  NSArray *textArray = [[NSArray alloc]
      initWithArray:[BasicUtility getSeparatedLinesFromLabelText:_model.desc
                                                      labelWidth:DescLabelWidth
                                                       labelFont:font]];
  _textArray = [[NSArray alloc] initWithArray:textArray];
  if (_textArray.count == 1) {
    _descLabel.text = _describeText;
    self.descLabel.numberOfLines = 1;
  }
  if (_textArray.count == 2) {
    _descLabel.text = _describeText;
    self.descLabel.numberOfLines = 2;
  }
  if (_textArray.count > 2) {
    _moreButton.hidden = NO;
    if (_model.showMore) {
      _descLabel.text = _describeText;
      self.descLabel.numberOfLines = 0;

    } else {
      self.descLabel.numberOfLines = 2;

      NSInteger subIndex =
          (DescLabelWidth / [_model textOneLine].width) * TOPIC.length * 2 - 6;

      NSInteger btnIndex =
          (DescLabelWidth / [_model textOneLine].width) * TOPIC.length - 4;
      subIndex = MIN(subIndex, _describeText.length);
      btnIndex = MIN(btnIndex, _describeText.length);
      NSString *btnString = [_describeText substringToIndex:btnIndex];
      NSString *string = [_describeText substringToIndex:subIndex];
      NSString *stringLess = [string stringByAppendingString:@"..."];

      self.descLabel.text = stringLess;
      _moreBtnToLeft.constant =
          [BasicUtility returnLabelWidthWithFont:[UIFont systemFontOfSize:17.0]
                                   maxSizeHeight:[_model textOneLine].height
                                            text:btnString]
              .width;
    }
  }
}

- (IBAction)moreAboutDescribe:(id)sender {
  [_moreButton setTitle:[self moreShow] forState:UIControlStateNormal];
  _descLabel.userInteractionEnabled = YES;
  _showMore = !_showMore;

  if (self.ShowMoreText) {
    self.ShowMoreText(_showMore);
  }
  [self _desLabelArray];
}

- (NSString *)moreShow {
  if (!_model.showMore) {
    return @"[更多]";
  } else {
    return @"[收起]";
  }
}

@end
