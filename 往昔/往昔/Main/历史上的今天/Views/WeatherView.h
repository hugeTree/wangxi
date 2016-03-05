//
//  WeatherView.h
//  往昔
//
//  Created by 干晨威 on 16/2/22.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WeatherHeadView.h"

@interface WeatherView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *todayDataArr;
@property (nonatomic, strong) NSMutableArray *futureDataArr;
@property (nonatomic, strong) NSMutableArray *lifeDataArr;

//@property (nonatomic, strong) WeatherHeadView *weatherHeadView;

@end
