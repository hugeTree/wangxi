//
//  TodayTableView.h
//  往昔
//
//  Created by 干晨威 on 16/2/6.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayCell.h"
#import "AdView.h"

@interface TodayTableView : UITableView <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) AdView *headView;

//@property (nonatomic, strong) HeadImageView *pageOneImgView;
//@property (nonatomic, strong) HeadImageView *pageTwoImgView;
//@property (nonatomic, strong) HeadImageView *pageThreeImgView;

@property (nonatomic, strong) UIPageControl *pageCtrl;

- (UIViewController *)viewController;
- (UINavigationController *)navigationController;

@end
