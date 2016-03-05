//
//  FutureWeatherModel.h
//  往昔
//
//  Created by 干晨威 on 16/2/22.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "JSONModel.h"

@interface FutureWeatherModel : JSONModel

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *week;

@property (nonatomic, copy) NSString *dawnWeatherInfo;  //黎明

@property (nonatomic, copy) NSString *dawnTemperature;

@property (nonatomic, copy) NSString *dawnWindDirect;

@property (nonatomic, copy) NSString *dawnWindPower;

@property (nonatomic, copy) NSString *dayWeatherInfo;  //白天

@property (nonatomic, copy) NSString *dayTemperature;

@property (nonatomic, copy) NSString *dayWindDirect;

@property (nonatomic, copy) NSString *dayWindPower;

@property (nonatomic, copy) NSString *nightWeatherInfo;  //夜晚

@property (nonatomic, copy) NSString *nightTemperature;

@property (nonatomic, copy) NSString *nightWindDirect;

@property (nonatomic, copy) NSString *nightWindPower;

@property (nonatomic, copy) NSString *nongliDate;

@end
