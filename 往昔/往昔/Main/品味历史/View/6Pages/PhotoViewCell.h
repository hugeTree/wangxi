//
//  PhotoViewCell.h
//  往昔
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OldPhotoLayout.h"
#import "WXLabel.h"

@interface PhotoViewCell : UITableViewCell <WXLabelDelegate>

@property (nonatomic, strong)OldPhotoLayout *layoutFrame;
@property (nonatomic, strong)NSMutableArray *imgViewArr;

@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, strong)WXLabel *titleLabel;
@property (nonatomic, strong)UILabel *sourceLabel;
@property (nonatomic, strong)UILabel *timeLabel;

@end
