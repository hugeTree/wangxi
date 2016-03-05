//
//  MovieCollectionVIew.m
//  往昔
//
//  Created by mac on 16/2/28.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "MovieCollectionView.h"
#import "MovieCollectionViewCell.h"
#import "MovieDetailsViewController.h"
#import "UIView+ViewController.h"

#define movieCollectionViewCell @"movieCollectionViewCell"

@implementation MovieCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 5;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        _mutData = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.alwaysBounceVertical = YES;
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[MovieCollectionViewCell class] forCellWithReuseIdentifier:movieCollectionViewCell];
    }
    return self;
}

#pragma -mark -UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
//    NSLog(@"%lu", (unsigned long)self.mutData.count);
    return self.mutData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:movieCollectionViewCell forIndexPath:indexPath];
    
    cell.data = self.mutData[indexPath.row];
    cell.tag = 400 + indexPath.row;
    cell.backgroundColor = [UIColor darkGrayColor];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (collectionView.tag % 2 == 0) {
        return UIEdgeInsetsMake(10, 20, 10, 20);
        
    }else {
        return UIEdgeInsetsMake(10, -20, 10, 20);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"%f %f", kCellWidth, kCellHeight);
    return CGSizeMake(kCellWidth, kCellHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieDetailsViewController *movieDetailsVC = [[MovieDetailsViewController alloc] init];
    
    movieDetailsVC.data = self.mutData[indexPath.row];
    
    [collectionView.viewController.navigationController pushViewController:movieDetailsVC animated:YES];
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

@end
