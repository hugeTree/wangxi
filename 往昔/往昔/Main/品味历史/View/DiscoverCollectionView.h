//
//  DiscoverCollectionView.h
//  项目三
//
//  Created by mac on 16/2/1.
//  Copyright © 2016年 lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverCollectionView : UICollectionView <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UISearchControllerDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray *disData;

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *airlines;

@end
