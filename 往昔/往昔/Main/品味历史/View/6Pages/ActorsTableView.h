//
//  ActorsTableView.h
//  往昔
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

//字体大小
#define kChineseTitleFont 15
//文字缩进
#define kHeadIndent 40

@interface ActorsTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)MovieModel *dataModel;

@end
