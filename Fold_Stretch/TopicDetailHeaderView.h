//
//  TopicDetailHeaderView.h
//  inke
//
//  Created by Charles Wang on 16/3/10.
//  Copyright © 2016年 MeeLive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"

@interface TopicDetailHeaderView : UIView

@property(nonatomic, strong) TopicModel *model;

@property(nonatomic,assign)BOOL showMore;

@property(nonatomic, copy) void (^ShowMoreText)(BOOL showMoreText);

- (void)TopicDetailWithModel:(TopicModel *)model;

@end

