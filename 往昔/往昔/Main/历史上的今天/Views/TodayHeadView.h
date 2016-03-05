//
//  TodayHeadView.h
//  往昔
//
//  Created by 干晨威 on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadImageView.h"

@interface TodayHeadView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *myScrollView;

@property (nonatomic, strong) HeadImageView *pageOneImgView;
@property (nonatomic, strong) HeadImageView *pageTwoImgView;
@property (nonatomic, strong) HeadImageView *pageThreeImgView;

@property (nonatomic, strong) UIPageControl *pageCtrl;

@property (nonatomic, assign) NSInteger pageCount;

@end
