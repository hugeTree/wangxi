//
//  OldPhotoLayout.m
//  往昔
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "OldPhotoLayout.h"
#import "WXLabel.h"

@implementation OldPhotoLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _imgFrameArr = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 3; i++) {
            
            [_imgFrameArr addObject:[NSValue valueWithCGRect:CGRectZero]];
        }
    }
    return self;
}

- (void)setDisModel:(DiscoverModel *)disModel {
    
    if (_disModel != disModel) {
        _disModel = disModel;
        
        [self _layoutFrame];
    }
    
}

- (void)_layoutFrame {

    CGFloat height = 0;
    CGFloat width = 0;
 
    //单图
    if (_disModel.urls.count == 1) {
        //标题
        width = kScreenWidth - kPicWidth - 2 * kLateralSpace;
        height = [WXLabel getTextHeight:kTitleTextFont width:width text:_disModel.title linespace:kTextLineSpace];
        
        self.titleFrame = CGRectMake(kLateralSpace, kVerticalSpace, width, height);
        //来源、时间
        if (kPicHeight - height > kSourceHeight + kLabelSpace) {
            
            self.sourceFrame = CGRectMake(kLateralSpace, kPicHeight - kSourceHeight + kVerticalSpace, kSoruceWidth, kSourceHeight);
            
            self.timeFrame = CGRectMake(kLateralSpace + kSoruceWidth, kPicHeight - kSourceHeight + kVerticalSpace, kTimeWidth, kSourceHeight);
        }else {
            
            self.sourceFrame = CGRectMake(kLateralSpace, kVerticalSpace + height + kLabelSpace, kSoruceWidth, kSourceHeight);
            
            self.timeFrame = CGRectMake(kLateralSpace + kSoruceWidth, kVerticalSpace + height + kLabelSpace, kTimeWidth, kSourceHeight);
        }
        //图片
        CGRect imgRect = CGRectMake(kScreenWidth - kPicWidth - kLateralSpace, kVerticalSpace, kPicWidth, kPicHeight);
        
        [self.imgFrameArr replaceObjectAtIndex:0 withObject:[NSValue valueWithCGRect:imgRect]];
        //单元格高度
        self.cellHeight = MAX(self.sourceFrame.origin.y + kSourceHeight + kVerticalSpace * 2, kPicHeight + kVerticalSpace * 2);
        //背景
        self.bgFrame = CGRectMake(kLateralSpace / 2, kVerticalSpace / 2, kScreenWidth - kLateralSpace, _cellHeight - kVerticalSpace);
        
    }else {//无图或多图
        //标题
        width = kScreenWidth - 2 * kLateralSpace;
        height = [WXLabel getTextHeight:kTitleTextFont width:width text:_disModel.title linespace:kTextLineSpace];
        
        self.titleFrame = CGRectMake(kLateralSpace, kVerticalSpace, width, height);
        //来源、时间
        self.sourceFrame = CGRectMake(kLateralSpace, kVerticalSpace + height + kLabelSpace + (kLabelSpace + kPicHeight) * (_disModel.urls.count / 3), kSoruceWidth, kSourceHeight);
            
        self.timeFrame = CGRectMake(kLateralSpace + kSoruceWidth, kVerticalSpace + height + kLabelSpace + kPicHeight * (_disModel.urls.count / 3), kTimeWidth, kSourceHeight);
        //图片
        for (int i = 0; i < _disModel.urls.count; i++) {
            
            CGRect rect = CGRectMake(kLateralSpace + i * (kLateralSpaceShort + kPicWidth), height + kVerticalSpace + kLabelSpace, kPicWidth, kPicHeight);
            
            [_imgFrameArr replaceObjectAtIndex:i withObject:[NSValue valueWithCGRect:rect]];
        }
        //单元格高度
        self.cellHeight = height + (kPicHeight + kLabelSpace) * (_disModel.urls.count / 3) + kSourceHeight + kLabelSpace + kVerticalSpace * 2;
        //背景
        self.bgFrame = CGRectMake(kLateralSpace / 2, kVerticalSpace / 2, kScreenWidth - kLateralSpace, _cellHeight - kVerticalSpace);
    }

}

@end
