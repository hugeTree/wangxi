//
//  WeatherFutureView.h
//  往昔
//
//  Created by 干晨威 on 16/2/23.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherFutureView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) CGFloat cellWidth;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end
