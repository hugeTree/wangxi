//
//  WeatherHeadCell.m
//  往昔
//
//  Created by 干晨威 on 16/2/23.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "WeatherHeadView.h"

@interface WeatherHeadView ()
{
    UILabel *currentLocation;  //当前城市
    
    UIImageView *degree;  //温度图片
    
    UILabel *windDLabel;
    
    UILabel *windPLabel;
    
//    UILabel *pm25Label;
    
//    UILabel *airQLabel;
}

@end

@implementation WeatherHeadView

- (void)awakeFromNib {
    // Initialization code
}


//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super initWithCoder:aDecoder])
//    {
//        [self createSubViews];
//        
////        [self calculateFrames];
//        
////        [self layoutFrames];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews
{
    //"当前城市"
    CGFloat currentLocationHeight = 20;
    CGFloat currentLocationWidth = 100;
    CGFloat currentLocationY = 30;
    CGFloat currentLocationX = (kScreenWidth - currentLocationWidth) / 2;
    
    currentLocation = [[UILabel alloc] initWithFrame:CGRectMake(currentLocationX, currentLocationY, currentLocationWidth, currentLocationHeight)];
    currentLocation.textAlignment = NSTextAlignmentCenter;
    currentLocation.textColor = [UIColor whiteColor];
    currentLocation.font = [UIFont systemFontOfSize:16];
    
    NSLog(@"%@",currentLocation);
    
    [self addSubview:currentLocation];
    
    //城市名
    CGFloat cityNameWidth = 100;
    CGFloat cityNameHeight = 40;
    CGFloat cityNameY = CGRectGetMaxY(currentLocation.frame);
    CGFloat cityNameX = (kScreenWidth - cityNameWidth) / 2;
    
    _cityName = [[UILabel alloc] initWithFrame:CGRectMake(cityNameX, cityNameY, cityNameWidth, cityNameHeight)];
    _cityName.textAlignment = NSTextAlignmentCenter;
    _cityName.textColor = [UIColor whiteColor];
    _cityName.font = [UIFont systemFontOfSize:35];
    
    [self addSubview:_cityName];
    
    //当前天气
    CGFloat weatherInfoWidth = 100;
    CGFloat weatherInfoHeight = 25;
    CGFloat weatherInfoY = CGRectGetMaxY(_cityName.frame) + 10;
    CGFloat weatherInfoX = (kScreenWidth - weatherInfoWidth) / 2;
    
    _weatherInfo = [[UILabel alloc] initWithFrame:CGRectMake(weatherInfoX, weatherInfoY, weatherInfoWidth, weatherInfoHeight)];
    _weatherInfo.textAlignment = NSTextAlignmentCenter;
    _weatherInfo.textColor = [UIColor whiteColor];
    _weatherInfo.font = [UIFont systemFontOfSize:22];
    
    [self addSubview:_weatherInfo];
    
    //温度
    CGFloat temperatureWidth = 140;
    CGFloat temperatureHeight = 80;
    CGFloat temperatureY = CGRectGetMaxY(_weatherInfo.frame);
    CGFloat temperatureX = (kScreenWidth - temperatureWidth) / 2;
    
    _temperature = [[UILabel alloc] initWithFrame:CGRectMake(temperatureX, temperatureY, temperatureWidth, temperatureHeight)];
    _temperature.textAlignment = NSTextAlignmentCenter;
    _temperature.textColor = [UIColor whiteColor];
    _temperature.font = [UIFont systemFontOfSize:75];
    
    [self addSubview:_temperature];
    
    //摄氏度图片
    CGFloat degreeWidth = 40;
    CGFloat degreeHeight = 40;
    CGFloat degreeY = CGRectGetMaxY(_weatherInfo.frame);
    CGFloat degreeX = CGRectGetMaxX(_temperature.frame) - 40;
    
    degree = [[UIImageView alloc] initWithFrame:CGRectMake(degreeX, degreeY, degreeWidth, degreeHeight)];
    
    [self addSubview:degree];
    
    //空气质量
    CGFloat airQualityWidth = 100;
    CGFloat airQualityHeight = 20;
    CGFloat airQualityY = CGRectGetMaxY(_weatherInfo.frame);
    CGFloat airQualityX = CGRectGetMinX(_temperature.frame) - airQualityWidth;
    
    _airQuality = [[UILabel alloc] initWithFrame:CGRectMake(airQualityX, airQualityY, airQualityWidth, airQualityHeight)];
    _airQuality.textAlignment = NSTextAlignmentCenter;
    _airQuality.textColor = [UIColor whiteColor];
    _airQuality.font = [UIFont systemFontOfSize:18];
    
    [self addSubview:_airQuality];
    
    //PM2.5
    CGFloat pm25Width = 100;
    CGFloat pm25Height = 20;
    CGFloat pm25Y = CGRectGetMaxY(_airQuality.frame) + 5;
    CGFloat pm25X = CGRectGetMinX(_airQuality.frame);
    
    _pm25 = [[UILabel alloc] initWithFrame:CGRectMake(pm25X, pm25Y, pm25Width, pm25Height)];
    _pm25.textAlignment = NSTextAlignmentCenter;
    _pm25.textColor = [UIColor whiteColor];
    _pm25.font = [UIFont systemFontOfSize:18];
    
    [self addSubview:_pm25];
    
    //湿度
    CGFloat humidityWidth = 100;
    CGFloat humidityHeight = 20;
    CGFloat humidityY = CGRectGetMaxY(_pm25.frame) + 5;
    CGFloat humidityX = CGRectGetMinX(_pm25.frame);
    
    _humidity = [[UILabel alloc] initWithFrame:CGRectMake(humidityX, humidityY, humidityWidth, humidityHeight)];
    _humidity.textAlignment = NSTextAlignmentCenter;
    _humidity.textColor = [UIColor whiteColor];
    _humidity.font = [UIFont systemFontOfSize:18];
    
    [self addSubview:_humidity];
    
    //风向
    CGFloat windDirectWidth = 100;
    CGFloat windDirectHeight = 20;
    CGFloat windDirectY = CGRectGetMaxY(_weatherInfo.frame) + 10;
    CGFloat windDirectX = CGRectGetMaxX(_temperature.frame);
    
    _windDirect = [[UILabel alloc] initWithFrame:CGRectMake(windDirectX, windDirectY, windDirectWidth, windDirectHeight)];
    _windDirect.textAlignment = NSTextAlignmentCenter;
    _windDirect.textColor = [UIColor whiteColor];
    _windDirect.font = [UIFont systemFontOfSize:18];
    
    [self addSubview:_windDirect];
    
    //风力
    CGFloat windPowerWidth = 100;
    CGFloat windPowerHeight = 20;
    CGFloat windPowerY = CGRectGetMaxY(_windDirect.frame) + 10;
    CGFloat windPowerX = CGRectGetMaxX(_temperature.frame);
    
    _windPower = [[UILabel alloc] initWithFrame:CGRectMake(windPowerX, windPowerY, windPowerWidth, windPowerHeight)];
    _windPower.textAlignment = NSTextAlignmentCenter;
    _windPower.textColor = [UIColor whiteColor];
    _windPower.font = [UIFont systemFontOfSize:18];
    
    [self addSubview:_windPower];
    
    //日期
    CGFloat dateWidth = 160;
    CGFloat dateHeight = 20;
    CGFloat dateY = CGRectGetMaxY(_temperature.frame) + 5;
    CGFloat dateX = (kScreenWidth - dateWidth) / 2;
    
    _date = [[UILabel alloc] initWithFrame:CGRectMake(dateX, dateY, dateWidth, dateHeight)];
    _date.textAlignment = NSTextAlignmentCenter;
    _date.textColor = [UIColor whiteColor];
    _date.font = [UIFont systemFontOfSize:18];
    
    [self addSubview:_date];
    
    //农历
    CGFloat nongliWidth = 120;
    CGFloat nongliHeight = 20;
    CGFloat nongliY = CGRectGetMaxY(_date.frame) + 5;
    CGFloat nongliX = (kScreenWidth - nongliWidth) / 2 - 60;
    
    _nongliDate = [[UILabel alloc] initWithFrame:CGRectMake(nongliX, nongliY, nongliWidth, nongliHeight)];
    _nongliDate.textAlignment = NSTextAlignmentRight;
    _nongliDate.textColor = [UIColor whiteColor];
    _nongliDate.font = [UIFont systemFontOfSize:18];
    
    [self addSubview:_nongliDate];
    
    //星期几
    CGFloat weekDayWidth = 60;
    CGFloat weekDayHeight = 20;
    CGFloat weekDayY = CGRectGetMaxY(_date.frame) + 5;
    CGFloat weekDayX = CGRectGetMaxX(_nongliDate.frame) + 10;
    
    _weekDay = [[UILabel alloc] initWithFrame:CGRectMake(weekDayX, weekDayY, weekDayWidth, weekDayHeight)];
    _weekDay.textAlignment = NSTextAlignmentCenter;
    _weekDay.textColor = [UIColor whiteColor];
    _weekDay.font = [UIFont systemFontOfSize:18];
    
    [self addSubview:_weekDay];
}

- (void)calculateFrames
{
    
}

- (void)layoutFrames
{
    
}

- (void)setTodayWeatherModel:(TodayWeatherModel *)todayWeatherModel
{
    if (_todayWeatherModel != todayWeatherModel)
    {
        _todayWeatherModel = todayWeatherModel;
        
//        [self calculateFrames];
        
//        [self layoutFrames];
        
        currentLocation.text = @"当前城市";
        degree.image = [UIImage imageNamed:@"weather-temperature.png"];
//        airQLabel.text = @"空气质量：";
        
        
        
        _cityName.text = _todayWeatherModel.cityName;
        
        NSLog(@"cityname = %@",_cityName.text);
//        [_cityName setNeedsDisplay];
        
        _temperature.text = _todayWeatherModel.temperature;
        _weatherInfo.text = _todayWeatherModel.weatherInfo;
        _airQuality.text = _todayWeatherModel.airQuality;
        _pm25.text = [NSString stringWithFormat:@"PM2.5  %@",_todayWeatherModel.pm25];
        _humidity.text = [NSString stringWithFormat:@"湿度  %@",_todayWeatherModel.humidity];
        _windDirect.text = _todayWeatherModel.windDirect;
        _windPower.text = _todayWeatherModel.windPower;
        _date.text = _todayWeatherModel.date;
        _nongliDate.text = _todayWeatherModel.nongli;
        _weekDay.text = _todayWeatherModel.weekDay;
    }
}

//改变子视图透明度
- (void)chageAlphaForSubViews:(CGFloat)rate
{
    _cityName.alpha = 1.0 - rate;
    _weatherInfo.alpha = 1.0 - rate;
    _airQuality.alpha = 1.0 - rate;
    _pm25.alpha = 1.0 - rate;
    _humidity.alpha = 1.0 - rate;
    _windDirect.alpha = 1.0 - rate;
    _windPower.alpha = 1.0 - rate;
    _date.alpha = 1.0 - rate;
    _nongliDate.alpha = 1.0 - rate;
    _weekDay.alpha = 1.0 - rate;
}

@end
