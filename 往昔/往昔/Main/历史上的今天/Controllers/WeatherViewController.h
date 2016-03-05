//
//  WeatherViewController.h
//  往昔
//
//  Created by 干晨威 on 16/2/20.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "BaseViewController.h"
#import "WeatherHeadView.h"

@interface WeatherViewController : BaseViewController

@property (nonatomic, strong) NSMutableArray *todayDataArr;
//@property (nonatomic, strong) NSMutableArray *futureDataArr;
//@property (nonatomic, strong) NSMutableArray *lifeDataArr;

@property (nonatomic, strong) WeatherHeadView *weatherHeadView;

@end
