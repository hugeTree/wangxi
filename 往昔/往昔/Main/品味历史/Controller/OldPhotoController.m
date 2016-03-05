//
//  OldPhotoController.m
//  往昔
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "OldPhotoController.h"
#import "PhotoTableView.h"
#import "DiscoverModel.h"
#import "OldPhotoLayout.h"

@interface OldPhotoController ()
{
    PhotoTableView *_tableView;
}

@end

@implementation OldPhotoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self _createTableView];
    [self _createBackButton];
    
    [self _loadData];
}

- (void)_loadData {
    
    NSString *urlString = @"http://a1.go2yd.com/Website/channel/news-list-for-channel?version=010915&distribution=com.apple.appstore&appid=history&cv=2.1.0.0&platform=0&net=wifi&version=010915&distribution=com.apple.appstore&appid=history&cv=2.1.0.0&platform=0&net=wifi&appid=history&cv=2.1.0.0&distribution=com.apple.appstore&fields[]=title&fields[]=url&fields[]=source&fields[]=date&fields[]=image&fields[]=image_urls&fields[]=comment_count&fields[]=like&fields[]=up&fields[]=down&infinite=true&net=wifi&platform=0&refresh=1&version=010915";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    [manager.requestSerializer setValue:@"JSESSIONID=xDVeXaQPnml5BnS3edEEwg" forHTTPHeaderField:@"Cookie"];
   
    NSNumber *channelId = @0;
    
    switch (self.item) {
        case 0:{
            
            [self loadDataPost];
            break;
        }
        case 1:{
            
            channelId = @2291931339;
            break;
        }
        case 2:{
            
            channelId = @2291931359;
            break;
        }
        case 3:{
            
            break;
        }
        case 4:{
            
            channelId = @2291931351;
            break;
        }
        case 5:{
            
            channelId = @2291931427;
            break;
        }
            
        default:
            break;
    }
    
    NSDictionary *param = @{
                            @"cstart"    :  @0,
                            @"cend"      :  @30,
                            @"channel_id":  channelId
                            };
    
    if (self.item != 0) {
        
        [manager GET:urlString parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self loadDataDidFinish:responseObject];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        
    }
    
}

- (void)loadDataPost {
    
    NSString *urlString = @"http://a1.go2yd.com/Website/channel/news-list-for-best-channel?fields=title&fields=url&fields=source&fields=date&fields=image&fields=image_urls&fields=comment_count&fields=like&fields=up&fields=down&refresh=1&infinite=true&appid=history&version=010915&distribution=com.apple.appstore&appid=history&cv=2.1.0.0&platform=0&net=wifi";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    [manager.requestSerializer setValue:@"JSESSIONID=xDVeXaQPnml5BnS3edEEwg" forHTTPHeaderField:@"Cookie"];
    
    NSDictionary *param = @{
                            @"cstart"    :  @0,
                            @"cend"      :  @30
                            
                            };
    
    [manager POST:urlString parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self loadDataDidFinish:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)loadDataDidFinish:(id)result {

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
