//
//  TodayViewController.h
//  往昔
//
//  Created by 干晨威 on 16/2/5.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "BaseViewController.h"
#import "TodayTableView.h"

@interface TodayViewController : BaseViewController


@property (weak, nonatomic) IBOutlet TodayTableView *todayTableView;

@property (nonatomic, assign) BOOL chooseDateViewShowed;

@property (nonatomic, strong) UIButton *chooseDateButton;

- (void)loadDataFinish:(id)responseObject;

- (void)hideChooseDateView;
- (void)showChooseDateView;
@end
