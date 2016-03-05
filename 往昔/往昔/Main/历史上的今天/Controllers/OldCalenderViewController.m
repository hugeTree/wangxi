//
//  OldCalenderViewController.m
//  往昔
//
//  Created by 干晨威 on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "OldCalenderViewController.h"
#import "OldCalenderModel.h"
#import "BaseTabBarController.h"
#import "TodayViewController.h"


@interface OldCalenderViewController ()

@end

@implementation OldCalenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"老黄历";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.hidesBackButton = YES;
    
    [self createBackButton];
    
    _oldCalenderView = [[OldCalenderView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_oldCalenderView];
    
    [self loadData];
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

- (void)loadData
{
    NSString *urlString = @"http://v.juhe.cn/laohuangli/d";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    //根据当前时间来获得月份和日期
    // 1.创建当前时间对象
    NSDate *nowDate = [NSDate date];
    // 2.创建日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 3.利用日历对象获取年月日时分秒
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *components =[calendar components:unit fromDate:nowDate];
    
    NSInteger year = components.year;
    NSInteger month = components.month;
    NSInteger day = components.day;
    
    NSString *dateStr = [NSString stringWithFormat:@"%ld-%02ld-%02ld",year,month,day];
    
    NSLog(@"%@",dateStr);
    
    NSDictionary *params = @{
                             @"key" : @"8dbbb049f42bccc34c479041c0b4adff",
                             @"date" : dateStr
                             };
    
    
    [manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
//        NSLog(@"请求成功\n%@",responseObject);
        
        [self loadDataFinish:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败\n%@",error);
    }];
}

- (void)loadDataFinish:(id)responseObject
{
    NSDictionary *resultDic = responseObject[@"result"];
    
//    NSLog(@"%@",resultDic);
    
    OldCalenderModel *oldCalenderModel = [[OldCalenderModel alloc] initWithDictionary:resultDic error:NULL];
    
//    NSLog(@"%@",oldCalenderModel);
    
    _oldCalenderView.oldCalenderModel = oldCalenderModel;
    
//    NSLog(@"%@",_oldCalenderView.oldCalenderModel);
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
