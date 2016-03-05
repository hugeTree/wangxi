//
//  PhotoTableView.h
//  往昔
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray *mutData;

@end
