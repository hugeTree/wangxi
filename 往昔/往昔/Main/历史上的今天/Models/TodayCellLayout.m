//
//  TodayCellLayout.m
//  往昔
//
//  Created by 干晨威 on 16/2/6.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "TodayCellLayout.h"
#import "WXLabel.h"

@implementation TodayCellLayout

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _bkgViewFrame = CGRectZero;
    }
    return self;
}

- (void)setTodayModel:(TodayModel *)todayModel
{
    if (_todayModel != todayModel)
    {
        _todayModel = todayModel;
        
        _bkgViewFrame = CGRectZero;
        
        _imgFrame = CGRectZero;
        
        [self layoutFrame];
    }
}

- (void)layoutFrame
{
    
    CGFloat textWidth = kScreenWidth - kSpaceSize * 2;
    
    CGFloat titleHeight = [WXLabel getTextHeight:kTitleSize width:textWidth text:_todayModel.title linespace:kTitleLineSpace];
    
    CGFloat subTitleHeight = [WXLabel getTextHeight:kSubTitleSize width:textWidth text:_todayModel.des linespace:kSubTitleLineSpace];
    
    if (_todayModel.pic.length != 0)
    {
        CGFloat imgWidth = kScreenWidth - kSpaceSize;
        

        _imgFrame = CGRectMake(kSpaceSize / 2, 0, imgWidth, 200);
        
//        _imgFrame = CGRectMake(0, -40, imgWidth, <#CGFloat height#>)
    }
    
    
    CGFloat titleY = CGRectGetMaxY(_imgFrame);
    _titleFrame = CGRectMake(kSpaceSize, titleY + kSpaceSize / 2, textWidth, titleHeight);
    
    CGFloat subTitleY = CGRectGetMaxY(_titleFrame);
    _subTitleFrame = CGRectMake(kSpaceSize, subTitleY + kSpaceSize / 2, textWidth, subTitleHeight);
    
    CGFloat bkgViewHeight = CGRectGetMaxY(_subTitleFrame);
    _bkgViewFrame = CGRectMake(kSpaceSize / 2, 0, kScreenWidth - kSpaceSize, bkgViewHeight + kSpaceSize / 2);
    
    _cellHeight = CGRectGetMaxY(_bkgViewFrame) + kSpaceSize;
    
}

@end
