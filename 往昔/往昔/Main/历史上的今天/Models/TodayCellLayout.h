//
//  TodayCellLayout.h
//  往昔
//
//  Created by 干晨威 on 16/2/6.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodayModel.h"

#define kTitleSize 16
#define kSubTitleSize 14
#define kSpaceSize 15
#define kTitleLineSpace  4
#define kSubTitleLineSpace 2
#define kYearLabelSize 20


@interface TodayCellLayout : NSObject

@property (nonatomic, strong) TodayModel *todayModel;

@property (nonatomic, assign) CGFloat cellHeight;  //cell高度

@property (nonatomic, assign) CGRect titleFrame;  //标题frame

@property (nonatomic, assign) CGRect subTitleFrame;  //子标题frame

@property (nonatomic, assign) CGRect imgFrame;  //图片frame

@property (nonatomic, assign) CGRect bkgViewFrame;  //cell底图frame

@property (nonatomic, assign) CGRect yealLabelFrame;  //年份标签frame

@end
