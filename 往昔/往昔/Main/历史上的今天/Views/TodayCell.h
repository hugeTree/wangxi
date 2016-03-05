//
//  TodayCell.h
//  往昔
//
//  Created by 干晨威 on 16/2/6.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayCellLayout.h"
#import "WXLabel.h"

@interface TodayCell : UITableViewCell <WXLabelDelegate>

@property (nonatomic, strong) TodayCellLayout *cellLayout;

@property (nonatomic, strong) WXLabel *titleLabel;

@property (nonatomic, strong) WXLabel *subTitleLabel;

@property (nonatomic, strong) WXLabel *yearLabel;

@property (nonatomic, strong) UIImageView *bkgImgView;

@property (nonatomic, strong) UIView *bkgView;

@property (nonatomic, strong) UIView *bkgImgViewWindow;

@property (nonatomic, copy) NSString *eventId;

@end
