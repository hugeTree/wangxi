//
//  WeatherFutureCell.m
//  往昔
//
//  Created by 干晨威 on 16/2/23.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "WeatherFutureCell.h"


@interface WeatherFutureCell ()
{
    UILabel *dawn;
    UILabel *day;
    UILabel *night;
}

@end

@implementation WeatherFutureCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self createSubViews];
    }
    return self;
}

- (void)setFutureWeatherModel:(FutureWeatherModel *)futureWeatherModel
{
    if (_futureWeatherModel != futureWeatherModel)
    {
        _futureWeatherModel = futureWeatherModel;
        
//        [self createSubViews];
        
        _date.text = _futureWeatherModel.date;
        _nongliDate.text = _futureWeatherModel.nongliDate;
        _weekDay.text = [NSString stringWithFormat:@"周%@",_futureWeatherModel.week];
        
        dawn.text = @"黎明";
        day.text = @"白天";
        night.text = @"夜晚";
        
        //早中晚天气
        if (_futureWeatherModel.dawnWeatherInfo.length > 0)
        {
             _dawnImgView.weatherInfo = _futureWeatherModel.dawnWeatherInfo;
        }
        
        if (_futureWeatherModel.dayWeatherInfo.length > 0)
        {
            _dayImgView.weatherInfo = _futureWeatherModel.dayWeatherInfo;
        }
        
        if (_futureWeatherModel.nightWeatherInfo.length > 0)
        {
            _nightImgView.weatherInfo = _futureWeatherModel.nightWeatherInfo;
        }
        
        //早中晚温度
        if (_futureWeatherModel.dawnTemperature.length > 0)
        {
            _dawnTemperature.text = _futureWeatherModel.dawnTemperature;
        }else
        {
            _dawnTemperature.text = @"暂无";
        }
        
        if (_futureWeatherModel.dayTemperature.length > 0)
        {
            _dayTemperature.text = _futureWeatherModel.dayTemperature;
        }else
        {
            _dayTemperature.text = @"暂无";
        }
        
        if (_futureWeatherModel.nightTemperature.length > 0)
        {
            _nightTemperature.text = _futureWeatherModel.nightTemperature;
        }else
        {
            _nightTemperature.text = @"暂无";
        }
        
//        NSLog(@"dawn = %@",_futureWeatherModel.dawnWindDirect);
//        NSLog(@"day = %@",_futureWeatherModel.dayWindDirect);
//        NSLog(@"night = %@",_futureWeatherModel.nightWindDirect);
        
        //早中晚风向
        if (_futureWeatherModel.dawnWindDirect.length > 0)
        {
            _dawnWindDirect.text = _futureWeatherModel.dawnWindDirect;
        }else
        {
            _dawnWindDirect.text = @"暂无";
        }
        
        if (_futureWeatherModel.dayWindDirect.length > 0)
        {
            _dayWindDirect.text = _futureWeatherModel.dayWindDirect;
        }else
        {
            _dayWindDirect.text = @"暂无";
        }
        
        if (_futureWeatherModel.nightWindDirect.length > 0)
        {
            _nightWindDirect.text = _futureWeatherModel.nightWindDirect;
        }else
        {
            _nightWindDirect.text = @"暂无";
        }
        
        //早中晚风力
        if (_futureWeatherModel.dawnWindPower.length > 0)
        {
            _dawnWindPower.text = _futureWeatherModel.dawnWindPower;
        }else
        {
            _dawnWindPower.text = @"暂无";
        }
        
        if (_futureWeatherModel.dayWindPower.length > 0)
        {
            _dayWindPower.text = _futureWeatherModel.dayWindPower;
        }else
        {
            _dayWindPower.text = @"暂无";
        }
        
        if (_futureWeatherModel.nightWindPower.length > 0)
        {
            _nightWindPower.text = _futureWeatherModel.nightWindPower;
        }else
        {
            _nightWindPower.text = @"暂无";
        }
        
    }
}

- (void)createSubViews
{
    //日期
    CGFloat dateWidth = self.frame.size.width;
    CGFloat dateHeight = 20;
    CGFloat dateY = 0;
    CGFloat dateX = 0;
    
    _date = [[UILabel alloc] initWithFrame:CGRectMake(dateX, dateY, dateWidth, dateHeight)];
    _date.textAlignment = NSTextAlignmentCenter;
    _date.textColor = [UIColor whiteColor];
    _date.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_date];
    
    //农历
    CGFloat nongliWidth = 120;
    CGFloat nongliHeight = 20;
    CGFloat nongliY = CGRectGetMaxY(_date.frame);
    CGFloat nongliX = 0;
    
    _nongliDate = [[UILabel alloc] initWithFrame:CGRectMake(nongliX, nongliY, nongliWidth, nongliHeight)];
    _nongliDate.textAlignment = NSTextAlignmentCenter;
    _nongliDate.textColor = [UIColor whiteColor];
    _nongliDate.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_nongliDate];
    
    //星期几
    CGFloat weekWidth = 90;
    CGFloat weekHeight = 20;
    CGFloat weekY = CGRectGetMaxY(_date.frame);
    CGFloat weekX = CGRectGetMaxX(_nongliDate.frame);
    
    _weekDay = [[UILabel alloc] initWithFrame:CGRectMake(weekX, weekY, weekWidth, weekHeight)];
    _weekDay.textAlignment = NSTextAlignmentCenter;
    _weekDay.textColor = [UIColor whiteColor];
    _weekDay.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_weekDay];
    
    //早中晚label
    CGFloat dawnWidth = 70;
    CGFloat dawnHeight = 20;
    CGFloat dawnY = CGRectGetMaxY(_nongliDate.frame);
    CGFloat dawnX = 0;
    
    dawn = [[UILabel alloc] initWithFrame:CGRectMake(dawnX, dawnY, dawnWidth, dawnHeight)];
    dawn.textAlignment = NSTextAlignmentCenter;
    dawn.textColor = [UIColor whiteColor];
    dawn.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:dawn];
    
    CGFloat dayWidth = 70;
    CGFloat dayHeight = 20;
    CGFloat dayY = CGRectGetMaxY(_nongliDate.frame);
    CGFloat dayX = 70;
    
    day = [[UILabel alloc] initWithFrame:CGRectMake(dayX, dayY, dayWidth, dayHeight)];
    day.textAlignment = NSTextAlignmentCenter;
    day.textColor = [UIColor whiteColor];
    day.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:day];
    
    CGFloat nightWidth = 70;
    CGFloat nightHeight = 20;
    CGFloat nightY = CGRectGetMaxY(_nongliDate.frame);
    CGFloat nightX = 140;
    
    night = [[UILabel alloc] initWithFrame:CGRectMake(nightX, nightY, nightWidth, nightHeight)];
    night.textAlignment = NSTextAlignmentCenter;
    night.textColor = [UIColor whiteColor];
    night.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:night];
    
    //早中晚天气图片
    CGFloat dawnImgWidth = 40;
    CGFloat dawnImgHeight = 40;
    CGFloat dawnImgY = CGRectGetMaxY(dawn.frame);
    CGFloat dawnImgX = 15;
    
    _dawnImgView = [[FutureWeatherImageView alloc] initWithFrame:CGRectMake(dawnImgX, dawnImgY, dawnImgWidth, dawnImgHeight)];
    
    [self.contentView addSubview:_dawnImgView];
    
    CGFloat dayImgWidth = 40;
    CGFloat dayImgHeight = 40;
    CGFloat dayImgY = CGRectGetMaxY(day.frame);
    CGFloat dayImgX = CGRectGetMaxX(_dawnImgView.frame) + 30;
    
    _dayImgView = [[FutureWeatherImageView alloc] initWithFrame:CGRectMake(dayImgX, dayImgY, dayImgWidth, dayImgHeight)];
    
    [self.contentView addSubview:_dayImgView];
    
    CGFloat nightImgWidth = 40;
    CGFloat nightImgHeight = 40;
    CGFloat nightImgY = CGRectGetMaxY(night.frame);
    CGFloat nightImgX = CGRectGetMaxX(_dayImgView.frame) + 30;
    
    _nightImgView = [[FutureWeatherImageView alloc] initWithFrame:CGRectMake(nightImgX, nightImgY, nightImgWidth, nightImgHeight)];
    
    [self.contentView addSubview:_nightImgView];
    
    //早中晚温度
    CGFloat dawnTemperatureWidth = 70;
    CGFloat dawnTemperatureHeight = 20;
    CGFloat dawnTemperatureY = CGRectGetMaxY(_dawnImgView.frame);
    CGFloat dawnTemperatureX = 0;
    
    _dawnTemperature = [[UILabel alloc] initWithFrame:CGRectMake(dawnTemperatureX, dawnTemperatureY, dawnTemperatureWidth, dawnTemperatureHeight)];
    _dawnTemperature.textAlignment = NSTextAlignmentCenter;
    _dawnTemperature.textColor = [UIColor whiteColor];
    _dawnTemperature.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_dawnTemperature];
    
    CGFloat dayTemperatureWidth = 70;
    CGFloat dayTemperatureHeight = 20;
    CGFloat dayTemperatureY = CGRectGetMaxY(_dayImgView.frame);
    CGFloat dayTemperatureX = 70;
    
    _dayTemperature = [[UILabel alloc] initWithFrame:CGRectMake(dayTemperatureX, dayTemperatureY, dayTemperatureWidth, dayTemperatureHeight)];
    _dayTemperature.textAlignment = NSTextAlignmentCenter;
    _dayTemperature.textColor = [UIColor whiteColor];
    _dayTemperature.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_dayTemperature];
    
    CGFloat nightTemperatureWidth = 70;
    CGFloat nightTemperatureHeight = 20;
    CGFloat nightTemperatureY = CGRectGetMaxY(_nightImgView.frame);
    CGFloat nightTemperatureX = 140;
    
    _nightTemperature = [[UILabel alloc] initWithFrame:CGRectMake(nightTemperatureX, nightTemperatureY, nightTemperatureWidth, nightTemperatureHeight)];
    _nightTemperature.textAlignment = NSTextAlignmentCenter;
    _nightTemperature.textColor = [UIColor whiteColor];
    _nightTemperature.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_nightTemperature];
    
    //早中晚风向
    CGFloat dawnWindDirectWidth = 70;
    CGFloat dawnWindDirectHeight = 20;
    CGFloat dawnWindDirectY = CGRectGetMaxY(_dawnTemperature.frame);
    CGFloat dawnWindDirectX = 0;
    
    _dawnWindDirect = [[UILabel alloc] initWithFrame:CGRectMake(dawnWindDirectX, dawnWindDirectY, dawnWindDirectWidth, dawnWindDirectHeight)];
    _dawnWindDirect.textAlignment = NSTextAlignmentCenter;
    _dawnWindDirect.textColor = [UIColor whiteColor];
    _dawnWindDirect.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_dawnWindDirect];
    
    CGFloat dayWindDirectWidth = 70;
    CGFloat dayWindDirectHeight = 20;
    CGFloat dayWindDirectY = CGRectGetMaxY(_dayTemperature.frame);
    CGFloat dayWindDirectX = 70;
    
    _dayWindDirect = [[UILabel alloc] initWithFrame:CGRectMake(dayWindDirectX, dayWindDirectY, dayWindDirectWidth, dayWindDirectHeight)];
    _dayWindDirect.textAlignment = NSTextAlignmentCenter;
    _dayWindDirect.textColor = [UIColor whiteColor];
    _dayWindDirect.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_dayWindDirect];
    
    CGFloat nightWindDirectWidth = 70;
    CGFloat nightWindDirectHeight = 20;
    CGFloat nightWindDirectY = CGRectGetMaxY(_nightTemperature.frame);
    CGFloat nightWindDirectX = 140;
    
    _nightWindDirect = [[UILabel alloc] initWithFrame:CGRectMake(nightWindDirectX, nightWindDirectY, nightWindDirectWidth, nightWindDirectHeight)];
    _nightWindDirect.textAlignment = NSTextAlignmentCenter;
    _nightWindDirect.textColor = [UIColor whiteColor];
    _nightWindDirect.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_nightWindDirect];

    //早中晚风力
    CGFloat dawnWindPowerWidth = 70;
    CGFloat dawnWindPowerHeight = 20;
    CGFloat dawnWindPowerY = CGRectGetMaxY(_dawnWindDirect.frame);
    CGFloat dawnWindPowerX = 0;
    
    _dawnWindPower = [[UILabel alloc] initWithFrame:CGRectMake(dawnWindPowerX, dawnWindPowerY, dawnWindPowerWidth, dawnWindPowerHeight)];
    _dawnWindPower.textAlignment = NSTextAlignmentCenter;
    _dawnWindPower.textColor = [UIColor whiteColor];
    _dawnWindPower.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_dawnWindPower];
    
    CGFloat dayWindPowerWidth = 70;
    CGFloat dayWindPowerHeight = 20;
    CGFloat dayWindPowerY = CGRectGetMaxY(_dayWindDirect.frame);
    CGFloat dayWindPowerX = 70;
    
    _dayWindPower = [[UILabel alloc] initWithFrame:CGRectMake(dayWindPowerX, dayWindPowerY, dayWindPowerWidth, dayWindPowerHeight)];
    _dayWindPower.textAlignment = NSTextAlignmentCenter;
    _dayWindPower.textColor = [UIColor whiteColor];
    _dayWindPower.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_dayWindPower];
    
    CGFloat nightWindPowerWidth = 70;
    CGFloat nightWindPowerHeight = 20;
    CGFloat nightWindPowerY = CGRectGetMaxY(_nightWindDirect.frame);
    CGFloat nightWindPowerX = 140;
    
    _nightWindPower = [[UILabel alloc] initWithFrame:CGRectMake(nightWindPowerX, nightWindPowerY, nightWindPowerWidth, nightWindPowerHeight)];
    _nightWindPower.textAlignment = NSTextAlignmentCenter;
    _nightWindPower.textColor = [UIColor whiteColor];
    _nightWindPower.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_nightWindPower];
    
}

@end
