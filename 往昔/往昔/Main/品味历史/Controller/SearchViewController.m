//
//  SearchViewController.m
//  往昔
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "SearchViewController.h"
#import "PhotoTableView.h"
#import "OldPhotoLayout.h"
#import "DiscoverViewController.h"
//@class DiscoverViewController;

@interface SearchViewController ()
{
    PhotoTableView *_tableView;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _createTableView];
    [self _loadData];
    
    [self _createBackButton];
}

- (void)_loadData {
    
    NSString *urlString = @"http://a1.go2yd.com/Website/channel/news-list-for-keyword?version=010915&distribution=com.apple.appstore&appid=history&cv=2.1.0.0&platform=0&net=wifi&version=010915&distribution=com.apple.appstore&appid=history&cv=2.1.0.0&platform=0&net=wifi&appid=history&cv=2.1.0.0&distribution=com.apple.appstore&fields[]=title&fields[]=url&fields[]=source&fields[]=date&fields[]=image&fields[]=image_urls&fields[]=comment_count&fields[]=like&fields[]=up&fields[]=down&infinite=true&net=wifi&platform=0&version=010915&word_type=token";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    [manager.requestSerializer setValue:@"JSESSIONID=WRiGZEvb0M8Do5eY8SLSwA" forHTTPHeaderField:@"Cookie"];
    
    NSString *str = [NSString stringWithFormat:@"%@",_searchName];
    NSDictionary *param = @{
                            @"cstart"    :  @0,
                            @"cend"      :  @100,
                            @"display"   :  str
                            };
    
    [manager GET:urlString parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self _loadDataFinished:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        NSLog(@"faild");
    }];
}

- (void)_loadDataFinished:(id)result {
    
    self.dataArr = [[NSMutableArray alloc] init];
    
    NSArray *arr = [NSArray array];
    
    arr = result[@"result"];
    
    for (NSDictionary *dic in arr) {
        
        DiscoverModel *model = [[DiscoverModel alloc] init];
        
        model.cType = dic[@"ctype"];
        model.impId = dic[@"impid"];
        model.pageId = dic[@"pageid"];
        model.itemId = dic[@"itemid"];
        model.docId = dic[@"docid"];
        
        model.title = dic[@"title"];
        
        model.url = dic[@"url"];
        model.urls = dic[@"image_urls"];
        model.imageStr = dic[@"image"];
        
        model.source = dic[@"source"];
        model.date = dic[@"date"];
        
        OldPhotoLayout *layout = [[OldPhotoLayout alloc] init];
        
        if ([model.cType isEqualToString:@"news"]) {
            
            layout.disModel = model;
            
            [_dataArr addObject:layout];
        }
    }
    
    if (_dataArr.count > 0) {
        
        [_tableView.mutData addObjectsFromArray:_dataArr];
    }
    
    [_tableView reloadData];
    
}

- (void)_createTableView {
    
    _tableView = [[PhotoTableView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_tableView];
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
    
    ((DiscoverViewController *)[self.navigationController.viewControllers objectAtIndex:0]).collectionView.searchController.searchBar.frame = CGRectMake(0, 0, kScreenWidth, 44);
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    BaseTabBarController *baseTabBarController = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [baseTabBarController hideTabBar];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    ((DiscoverViewController *)[self.navigationController.viewControllers objectAtIndex:0]).collectionView.searchController.searchBar.frame = CGRectMake(0, 0, kScreenWidth, 44);
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
