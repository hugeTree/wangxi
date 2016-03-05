//
//  LifeView.h
//  往昔
//
//  Created by 干晨威 on 16/2/24.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeModel.h"
#import "WeatherDetailLabel.h"

@interface LifeView : UIScrollView

@property (nonatomic, strong) LifeModel *lifeModel;

@property (nonatomic, strong) WeatherDetailLabel *kongtiao1;
@property (nonatomic, strong) WeatherDetailLabel *kongtiao2;

@property (nonatomic, strong) WeatherDetailLabel *yundong1;
@property (nonatomic, strong) WeatherDetailLabel *yundong2;

@property (nonatomic, strong) WeatherDetailLabel *ziwaixian1;
@property (nonatomic, strong) WeatherDetailLabel *ziwaixian2;

@property (nonatomic, strong) WeatherDetailLabel *ganmao1;
@property (nonatomic, strong) WeatherDetailLabel *ganmao2;

@property (nonatomic, strong) WeatherDetailLabel *xiche1;
@property (nonatomic, strong) WeatherDetailLabel *xiche2;

@property (nonatomic, strong) WeatherDetailLabel *wuran1;
@property (nonatomic, strong) WeatherDetailLabel *wuran2;

@property (nonatomic, strong) WeatherDetailLabel *chuanyi1;
@property (nonatomic, strong) WeatherDetailLabel *chuanyi2;

@property (nonatomic, strong) UIView *bkgView;

@end
