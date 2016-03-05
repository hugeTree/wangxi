//
//  DiscoverCollectionView.m
//  项目三
//
//  Created by mac on 16/2/1.
//  Copyright © 2016年 lin. All rights reserved.
//

#import "DiscoverCollectionView.h"

#import "UIView+ViewController.h"

#import "OldPhotoController.h"
#import "MovieViewController.h"
#import "WebViewController.h"
#import "SearchViewController.h"

#import "HeaderView.h"
#import "DiscoverModel.h"
#import "DiscoverCell.h"
#import "ModeTableView.h"


#define kHeaderHeight 60
#define kLineSpace 15

#define   kIdentify         @"DiscoverCell"
#define   kHeadIdentify     @"headerView"

@implementation DiscoverCollectionView
{
    ModeTableView *_modeTableView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 5;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        
        self.alwaysBounceVertical = YES;
        
        self.backgroundColor = [UIColor clearColor];
        self.viewController.navigationController.navigationBar.translucent = NO;

        self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        self.searchController.definesPresentationContext = YES;
        self.searchController.dimsBackgroundDuringPresentation = false;
        //代理设置
        self.delegate = self;
        self.dataSource = self;
        
        self.searchController.delegate = self;
        self.searchController.searchBar.delegate = self;

        //注册cell和头视图
        [self registerClass:[DiscoverCell class] forCellWithReuseIdentifier:kIdentify];
        [self registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeadIdentify];
        //加载数据
        [self _setData];
        [self _loadData];
    }
    return self;
}

- (void)_setData {
    
    NSArray *picArr = [[NSArray alloc] initWithObjects:@"top.jpg",@"yestone.jpg",@"old_photo.jpg",@"old_movie.jpg",@"old_thing.jpg",@"history.jpg", nil];
    NSArray *titleArr = [[NSArray alloc] initWithObjects:@"热门点击",@"战争史",@"老照片",@"老电影",@"清朝那些事儿",@"近代史", nil];
    
    self.disData = [NSMutableArray array];
    
    for (int i = 0; i < picArr.count; i++) {
        
        UIImage *image = [UIImage imageNamed:picArr[i]];
        
        DiscoverModel *model = [[DiscoverModel alloc] init];
        
        model.image = image;
        model.title = titleArr[i];
        
        [self.disData addObject:model];
        
    }
}

- (void)_loadData {
    
    NSString *urlString = @"http://a1.go2yd.com/Website/channel/recommend-channel?version=010915&distribution=com.apple.appstore&appid=history&cv=2.1.0.0&platform=0&net=wifi&version=010915&distribution=com.apple.appstore&appid=history&cv=2.1.0.0&platform=0&net=wifi&appid=history&cv=2.1.0.0&distribution=com.apple.appstore&net=wifi&platform=0&position=search&version=010915";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    [manager.requestSerializer setValue:@"JSESSIONID=WRiGZEvb0M8Do5eY8SLSwA" forHTTPHeaderField:@"Cookie"];
    
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self _loadDataFinished:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"faild");
    }];
}

- (void)_loadDataFinished:(id)result {
    
    NSArray *dataArr = result[@"channels"];
    self.airlines = [NSMutableArray array];
    
    for (NSDictionary *dic in dataArr) {
        
        [_airlines addObject:dic[@"name"]];
    }

}

#pragma mark -UICollectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
//    NSLog(@"%ld", (long)section);
    
    return _disData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DiscoverCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentify forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.disModel = self.disData[indexPath.row];
    cell.tag = 200 + indexPath.row;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = (kScreenWidth - 60)/ 2;
    CGFloat height = (kScreenHeight - 49 - 64 - kHeaderHeight - 3 * kLineSpace) / 3;
    
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (collectionView.tag % 2 == 0) {
        return UIEdgeInsetsMake(10, 20, 10, 20);

    }else {
        return UIEdgeInsetsMake(10, -20, 10, 20);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        HeaderView *header = [[HeaderView alloc] init];
        
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeadIdentify forIndexPath:indexPath];
        
        header.backgroundColor = [UIColor whiteColor];
        
        header.searchBar = self.searchController.searchBar;
        
        CGFloat const Y = 0;
        header.searchBar.frame = CGRectMake(0, Y, kScreenWidth, 44);
//        NSLog(@"%@", self.searchController.searchBar);
        
        return header;
        
    }
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(kScreenWidth, kHeaderHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        MovieViewController *movieVC = [[MovieViewController alloc] init];
        
        [self.viewController.navigationController pushViewController:movieVC animated:YES];
        
    }else {
        OldPhotoController *oldPhotoVC = [[OldPhotoController alloc] init];
        
        oldPhotoVC.item = indexPath.row;
        
        [self.viewController.navigationController pushViewController:oldPhotoVC animated:YES];
        
    }
    
}

#pragma -mark -UITableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.allowsSelection = NO;
    [self.searchController.searchBar resignFirstResponder];
    
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    
    searchVC.searchName = self.airlines[indexPath.row];
    
//    NSLog(@"%@", self.viewController.navigationController);
    
    [self.viewController.navigationController pushViewController:searchVC animated:YES];
//    tableView.allowsSelection = YES;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.viewController dismissViewControllerAnimated:YES completion:^{
        tableView.allowsSelection = YES;
    }];
    
}

#pragma -mark -UISearchBar delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
//        NSLog(@"search");
    [searchBar resignFirstResponder];
    if (searchBar.text) {
        
        NSString *keyword = searchBar.text;
        
        NSString *urlStart = @"https://m.baidu.com/from=844b/s?";
        NSString *key = @"word=";
        NSString *urlEnd = @"&ts=1312933&t_kt=0&ie=utf-8&rsv_iqid=17647501727490893312&rsv_t=72ce3yncprpsEeWWgD3J3tXoRcffvHzzZM%252FYmxeAVyBGpHjpJW%252Bz5mjJTg&sa=ib&rsv_pq=17647501727490893312&rsv_sug4=3827&inputT=1962&ss=100";
        
        NSMutableString *url = [NSMutableString string];
        [url appendString:urlStart];
        [url appendString:key];
        [url appendString:keyword];
        [url appendString:urlEnd];

//        NSString *url1 = @"https://www.baidu.com";
        [self handleSearchForTerm:url];
//        NSLog(@"%@", url);
        searchBar.text = nil;
        
        [self.viewController dismissViewControllerAnimated:YES completion:^{
                        
        }];
    }
}

- (void)handleSearchForTerm:(NSString *)searchTerm {
    
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.url = searchTerm;
    
    [self.viewController.navigationController pushViewController:webVC animated:YES];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        searchBar.text = nil;
        searchBar.frame = CGRectMake(0, 20, kScreenWidth, 44);
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma -mark -UISearchController delegate
- (void)willPresentSearchController:(UISearchController *)searchController {
    
    if (!_modeTableView) {
        _modeTableView = [[ModeTableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight)];
        
        _modeTableView.delegate = self;
        
        _modeTableView.airlines = self.airlines;
        [_modeTableView reloadData];
        
        [searchController.view addSubview:_modeTableView];
    }
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    
    searchController.searchBar.frame = CGRectMake(0, 0, kScreenWidth, 64);

}

- (void)willDismissSearchController:(UISearchController *)searchController {
    
//    NSLog(@"will dismiss");
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    
//    NSLog(@"did dismiss");
}

@end
