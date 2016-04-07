//
//  ViewController.m
//  Fold_Stretch
//
//  Created by Charles Wang on 16/3/28.
//  Copyright © 2016年 MeeLive. All rights reserved.
//

#import "TopicDetailHeaderView.h"
#import "TopicModel.h"
#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) TopicDetailHeaderView *headerView;
@property(nonatomic, strong) TopicModel *headerModel;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  _headerModel = [[TopicModel alloc] init];
  _headerModel.showMore = NO;
  _headerModel.desc =
      @"今"
      @"天"
      @"星"
      @"期"
      @"几"
      @"今天星期几今天星期几今天星期几今天星期几今天星"
      @"期"
      @"几"
      @"今"
      @"天"
      @"星期几。今天星期几今天星期几今天星期几今天星期几今天星今天星期几今天星期几今天星期几今天星期几今天星今天星期几今天星期几今天星期几今天星期几今天星";
  [self createHeaderView];
}

- (void)createHeaderView {
  __weak ViewController *weakSelf = self;

  _headerView = [[[NSBundle mainBundle]
      loadNibNamed:NSStringFromClass([TopicDetailHeaderView class])
             owner:nil
           options:nil] lastObject];

  [_headerView TopicDetailWithModel:_headerModel];
  [self _headerViewFrame];

  [self.view addSubview:_headerView];

  _headerView.ShowMoreText = ^(BOOL showMore) {
    weakSelf.headerModel.showMore = showMore;
    [weakSelf _headerViewFrame];
  };
}

- (void)_headerViewFrame {
  CGRect frame = _headerView.frame;
  frame.origin.y = 20;
  frame.size.height = [_headerModel DescriptionHeight];
  _headerView.frame = frame;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
