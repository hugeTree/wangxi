//
//  WeatherHeadCell.h
//  往昔
//
//  Created by 干晨威 on 16/2/23.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayWeatherModel.h"

@interface WeatherHeadView : UIView

@property (nonatomic, strong) TodayWeatherModel *todayWeatherModel;

@property (nonatomic, strong) UILabel *date;
@property (nonatomic, strong) UILabel *weekDay;
@property (nonatomic, strong) UILabel *nongliDate;
@property (nonatomic, strong) UILabel *weatherInfo;
@property (nonatomic, strong) UILabel *temperature;
@property (nonatomic, strong) UILabel *pm25;
@property (nonatomic, strong) UILabel *airQuality;
@property (nonatomic, strong) UILabel *windDirect;
@property (nonatomic, strong) UILabel *windPower;
@property (nonatomic, strong) UILabel *humidity;
@property (nonatomic, strong) UILabel *cityName;

- (void)chageAlphaForSubViews:(CGFloat)rate;

@end
