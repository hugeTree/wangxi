//
//  MovieCollectionViewCell.h
//  往昔
//
//  Created by mac on 16/2/28.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "StarView.h"

//高度宽度
#define kCellHeight   (kScreenHeight / 3 + 5)
#define kCellWidth    kCellHeight * 0.67

#define kTitleTextFont 20
#define kRatingTextFont 20

@interface MovieCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)MovieModel *data;

@property (nonatomic, strong)UIImageView *imgView;
@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)StarView *starView;
@property (nonatomic, strong)UILabel *ratingLabel;

@end
