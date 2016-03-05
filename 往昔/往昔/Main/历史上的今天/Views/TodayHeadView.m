//
//  TodayHeadView.m
//  往昔
//
//  Created by 干晨威 on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "TodayHeadView.h"

#define kHeadViewWidth self.frame.size.width
#define kHeadViewHeight 220

@implementation TodayHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _pageCount = 0;
        
        [self createScrollView];
        
        [self createImageViews];
        
        [self createPageCtrl];
    }
    return self;
}

- (void)createScrollView
{
    _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kHeadViewWidth, kHeadViewHeight)];
    
    _myScrollView.backgroundColor = [UIColor grayColor];
    _myScrollView.contentSize = CGSizeMake(kScreenWidth * 3, 220);
    _myScrollView.pagingEnabled = YES;
    _myScrollView.showsHorizontalScrollIndicator = NO;
    _myScrollView.delegate = self;
    _myScrollView.contentOffset = CGPointMake(0, 0);
    
    [self addSubview:_myScrollView];
}

- (void)createImageViews
{
    //添加imageView
    _pageOneImgView = [[HeadImageView alloc] initWithFrame:CGRectMake(0, 0, kHeadViewWidth, kHeadViewHeight)];
    _pageOneImgView.image = [UIImage imageNamed:@"oldcalender.png"];
    [_myScrollView addSubview:_pageOneImgView];
    
    _pageTwoImgView = [[HeadImageView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kHeadViewHeight)];
    _pageTwoImgView.backgroundColor = [UIColor redColor];
    [_myScrollView addSubview:_pageTwoImgView];
    
    _pageThreeImgView = [[HeadImageView alloc] initWithFrame:CGRectMake(kScreenWidth * 2, 0, kScreenWidth, kHeadViewHeight)];
    _pageThreeImgView.backgroundColor = [UIColor yellowColor];
    [_myScrollView addSubview:_pageThreeImgView];
    
}

- (void)createPageCtrl
{
    _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame) - 36, kScreenWidth, 36)];
    _pageCtrl.backgroundColor = [UIColor blueColor];
    _pageCtrl.numberOfPages = 3;
    _pageCtrl.currentPage = 0;
    [self addSubview:_pageCtrl];
}

#pragma - mark UIScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    
    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if (currentPage == 0)
    {
        HeadImageView *tmpImgView = _pageThreeImgView;
        _pageThreeImgView= _pageTwoImgView;
        _pageTwoImgView = _pageOneImgView;
        _pageOneImgView = tmpImgView;
        
//        _pageCtrl.currentPage = 2;
    }
    if (currentPage == 2)
    {
        //换指针
        HeadImageView *tmpImgView = _pageOneImgView;
        _pageOneImgView = _pageTwoImgView;
        _pageTwoImgView = _pageThreeImgView;
        _pageThreeImgView = tmpImgView;
        
//        _pageCtrl.currentPage = 0;
    }
    //恢复原位
    _pageOneImgView.frame = (CGRect){0,0,_pageOneImgView.frame.size};
    _pageTwoImgView.frame = (CGRect){kScreenWidth,0,_pageTwoImgView.frame.size};
    _pageThreeImgView.frame = (CGRect){kScreenWidth * 2,0,_pageThreeImgView.frame.size};
    _myScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
}

@end
