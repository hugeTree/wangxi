//
//  MovieViewController.m
//  往昔
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "MovieViewController.h"
//#import "MovieTableView.h"
#import "MovieCollectionView.h"
#import "MovieModel.h"

@interface MovieViewController ()
{
//    MovieTableView *_tableView;
    MovieCollectionView *_collectionView;
//    NSArray *_movieNameArr;
}
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _createCollectionView];
    [self _loadData];
    
    [self _createBackButton];
}

- (void)_createCollectionView {
    
    _collectionView = [[MovieCollectionView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_collectionView];
}

- (void)_loadData {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"movie1" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    
    NSDictionary *dataDic = [NSDictionary dictionary];
    dataDic = jsonDic[@"data"];
    NSArray *movieArr = [NSArray array];
    movieArr = dataDic[@"movie"];
    
    self.dataArr = [NSMutableArray array];
    
    for (NSDictionary *dic in movieArr) {
        
        MovieModel *model = [[MovieModel alloc] initWithDictionary:dic error:NULL];
        
        [_dataArr addObject:model];
    }
    _collectionView.mutData = _dataArr;
    [_collectionView reloadData];
}

- (void)_createBackButton {
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [backButton setImage:[UIImage imageNamed:@"item-back-white@2x.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = backItem;
    
}

- (void)backButtonAction:(UIButton *)button {
    
    BaseTabBarController *baseTabBarController = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [baseTabBarController showTabBar];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    BaseTabBarController *baseTabBarController = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [baseTabBarController hideTabBar];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
