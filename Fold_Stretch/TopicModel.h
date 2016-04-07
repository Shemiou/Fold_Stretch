//
//  TopicModel.h
//  Fold_Stretch
//
//  Created by Charles Wang on 16/3/29.
//  Copyright © 2016年 MeeLive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TopicModel : NSObject

@property(nonatomic, strong) NSString *desc;
@property(nonatomic, strong) NSString *image;
@property(nonatomic, strong) NSString *link;

@property(nonatomic,assign)BOOL showMore;

- (NSString *)moreShow;

- (CGSize)textOneLine;

- (CGFloat)DescriptionHeight;

@end
