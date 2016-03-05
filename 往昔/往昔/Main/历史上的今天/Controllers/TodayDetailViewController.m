//
//  TodayDetailViewController.m
//  往昔
//
//  Created by 干晨威 on 16/2/10.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "TodayDetailViewController.h"
#import "BaseTabBarController.h"
#import "TodayViewController.h"


@implementation TodayDetailViewController


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.view.backgroundColor = [UIColor whiteColor];
        
        _todayDetailView = [[TodayDetailView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        
        [self.view addSubview:_todayDetailView];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
    [self createBackButton];
}

//创建自定义返回按钮
- (void)createBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [backButton setImage:[UIImage imageNamed:@"item-back-white@2x.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = backItem;
    
}

- (void)backButtonAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//view将要显示时隐藏标签栏和导航栏上的选择日期按钮
- (void)viewWillAppear:(BOOL)animated
{
    BaseTabBarController *baseTabBarController = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [baseTabBarController hideTabBar];
    
    TodayViewController *todayViewController = [UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0].childViewControllers[0];
    
    todayViewController.chooseDateButton.hidden = YES;
    
}

//view将要消失时显示标签栏和导航栏上的选择日期按钮
- (void)viewWillDisappear:(BOOL)animated
{
    BaseTabBarController *baseTabBarController = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [baseTabBarController showTabBar];
    
    TodayViewController *todayViewController = [UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0].childViewControllers[0];
    
    todayViewController.chooseDateButton.hidden = NO;
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
