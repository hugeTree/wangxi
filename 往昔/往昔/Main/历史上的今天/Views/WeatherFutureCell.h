//
//  WeatherFutureCell.h
//  往昔
//
//  Created by 干晨威 on 16/2/23.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FutureWeatherModel.h"
#import "FutureWeatherImageView.h"

@interface WeatherFutureCell : UICollectionViewCell

@property (nonatomic, strong) FutureWeatherModel *futureWeatherModel;

@property (nonatomic, strong) UILabel *date;

@property (nonatomic, strong) UILabel *nongliDate;

@property (nonatomic, strong) UILabel *weekDay;

@property (nonatomic, strong) FutureWeatherImageView *dawnImgView;

@property (nonatomic, strong) FutureWeatherImageView *dayImgView;

@property (nonatomic, strong) FutureWeatherImageView *nightImgView;

@property (nonatomic, strong) UILabel *dawnWeatherInfo;

@property (nonatomic, strong) UILabel *dayWeatherInfo;

@property (nonatomic, strong) UILabel *nightWeatherInfo;

@property (nonatomic, strong) UILabel *dawnWindDirect;

@property (nonatomic, strong) UILabel *dayWindDirect;

@property (nonatomic, strong) UILabel *nightWindDirect;

@property (nonatomic, strong) UILabel *dawnWindPower;

@property (nonatomic, strong) UILabel *dayWindPower;

@property (nonatomic, strong) UILabel *nightWindPower;

@property (nonatomic, strong) UILabel *dawnTemperature;

@property (nonatomic, strong) UILabel *dayTemperature;

@property (nonatomic, strong) UILabel *nightTemperature;

@end
