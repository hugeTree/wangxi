//
//  WeatherDetailLabel.m
//  往昔
//
//  Created by 干晨威 on 16/2/24.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "WeatherDetailLabel.h"

@implementation WeatherDetailLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:16];
    }
    return self;
}

@end
