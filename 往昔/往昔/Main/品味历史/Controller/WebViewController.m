//
//  WebViewController.m
//  往昔
//
//  Created by mac on 16/2/22.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "WebViewController.h"
#import "DiscoverViewController.h"
#import "BaseTabBarController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _createWebView];
    [self _createBackButton];
}

- (void)_createWebView {
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    webView.scalesPageToFit = YES;
    
    NSString *strUTF8 = [self.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"%@", strUTF8);
    NSURL *urlString = [NSURL URLWithString:strUTF8];
    NSURLRequest* request = [NSURLRequest requestWithURL:urlString];
//    NSLog(@"%@", urlString);
//    NSLog(@"%@", request);
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
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
