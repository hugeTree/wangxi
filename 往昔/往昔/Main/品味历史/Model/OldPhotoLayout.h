//
//  OldPhotoLayout.h
//  往昔
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscoverModel.h"

//图片高度宽度
#define kPicWidth (kScreenWidth - 50) / 3.0
#define kPicHeight kPicWidth * 0.67
//垂直方向空白
#define kVerticalSpace 15
//横向空白
#define kLateralSpace 20
#define kLateralSpaceShort 5
//标题字体大小
#define kTitleTextFont 20
//来源字体大小
#define kSourceTextFont 12
//来源、时间高度
#define kSourceHeight 15
//来源宽度
#define kSoruceWidth 120
//时间宽度
#define kTimeWidth 120
//标题文字行间距
#define kTextLineSpace  6
//标题和来源之间的间距
#define kLabelSpace 10

@interface OldPhotoLayout : NSObject

@property (nonatomic, strong)DiscoverModel *disModel;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, assign) CGRect bgFrame;
@property (nonatomic, assign) CGRect titleFrame;
@property (nonatomic, assign) CGRect sourceFrame;
@property (nonatomic, assign) CGRect timeFrame;

@property (nonatomic, strong)NSMutableArray *imgFrameArr;

@end
