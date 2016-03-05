//
//  PosterView.h
//  往昔
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXLabel.h"
#import "MovieModel.h"

#define kPosterWidth    kScreenWidth / 3
#define kPosterHeight   kPosterWidth / 0.67
//字体大小
#define kChineseTitleFont 15
#define kEnglishTitleFont 15
//行间距
#define kLineSpace 5
//描述的位置设置
#define kExplianX       kPosterWidth + 20
#define kExplainWidth   kScreenWidth - kPosterWidth - 20

@interface PosterView : UIView

@property (nonatomic, strong)MovieModel *data;

@end
