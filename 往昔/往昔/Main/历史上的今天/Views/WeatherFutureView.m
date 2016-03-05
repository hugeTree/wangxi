//
//  WeatherFutureView.m
//  往昔
//
//  Created by 干晨威 on 16/2/23.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "WeatherFutureView.h"
#import "WeatherFutureCell.h"
#import "FutureWeatherModel.h"

@implementation WeatherFutureView

- (instancetype)initWithFrame:(CGRect)frame
{
    //---设置布局对象
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //---设置滑方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //---移除单元格间距
    flowLayout.minimumLineSpacing = 0;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        //---隐藏竖直和水平的滑动条
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        //---设置代理
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[WeatherFutureCell class] forCellWithReuseIdentifier:@"weatherFutureCell"];
        
//        //设置scrollView减速的速度，范围是（0-1），默认是0，
//        self.decelerationRate = 1;
    }
    return self;
}

- (void)setDataArr:(NSMutableArray *)dataArr
{
    if (_dataArr != dataArr)
    {
        _dataArr = dataArr;
        
        [self reloadData];
    }
}


#pragma - mark UICollectionView Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(210, 200);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherFutureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"weatherFutureCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor blackColor];
    
    FutureWeatherModel *futureWeatherModel = _dataArr[indexPath.item];
    
    cell.futureWeatherModel = futureWeatherModel;
    
    return cell;
}

@end
