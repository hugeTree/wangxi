//
//  MovieCollectionVIew.h
//  往昔
//
//  Created by mac on 16/2/28.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCollectionView : UICollectionView <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong)NSMutableArray *mutData;

@end
