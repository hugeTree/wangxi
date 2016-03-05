//
//  TodayWeatherModel.h
//  往昔
//
//  Created by 干晨威 on 16/2/22.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "JSONModel.h"

@interface TodayWeatherModel : JSONModel

@property (nonatomic, copy) NSString *windDirect;

@property (nonatomic, copy) NSString *windPower;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *humidity;

@property (nonatomic, copy) NSString *weatherInfo;

@property (nonatomic, copy) NSString *temperature;

@property (nonatomic, copy) NSString *cityName;

@property (nonatomic, copy) NSString *nongli;

@property (nonatomic, copy) NSString *weekDay;

@property (nonatomic, copy) NSString *airQuality;

@property (nonatomic, copy) NSString *pm25;

@end
