//
//  FutureWeatherImageView.m
//  往昔
//
//  Created by 干晨威 on 16/2/24.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "FutureWeatherImageView.h"

@implementation FutureWeatherImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
    }
    return self;
}

- (void)setWeatherInfo:(NSString *)weatherInfo
{
    if ([weatherInfo isEqualToString:@"晴"])
    {
        self.image = [UIImage imageNamed:@"weather-sun.png"];
    }else if ([weatherInfo isEqualToString:@"多云"])
    {
        self.image = [UIImage imageNamed:@"weather-sun-cloud.png"];
    }else if ([weatherInfo isEqualToString:@"阴"])
    {
        self.image = [UIImage imageNamed:@"weather-cloud.png"];
    }else if ([weatherInfo isEqualToString:@"雨"])
    {
        self.image = [UIImage imageNamed:@"weather-rain.png"];
    }else if ([weatherInfo isEqualToString:@"雪"])
    {
        self.image = [UIImage imageNamed:@"weather-snow.png"];
    }
}

@end
