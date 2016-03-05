//
//  ActorsTableViewCell.h
//  往昔
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "WXLabel.h"

//字体大小
#define kChineseTitleFont 15
//行间距
#define kLineSpace 5
//文字缩进
#define kHeadIndent 40

@interface ActorsTableViewCell : UITableViewCell

@property (nonatomic, strong)MovieModel *data;

@property (nonatomic, strong)UILabel *directorLabel;
@property (nonatomic, strong)UILabel *actorsLabel;

@end
