//
//  DiscoverCell.h
//  Discover
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DiscoverModel;
@interface DiscoverCell : UICollectionViewCell

@property (nonatomic, strong)UIImageView *imgView;
@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)DiscoverModel *disModel;

@end
