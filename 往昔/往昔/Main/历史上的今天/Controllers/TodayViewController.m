//
//  TodayViewController.m
//  往昔
//
//  Created by 干晨威 on 16/2/5.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "TodayViewController.h"
#import "ChooseDateView.h"


#define kChooseDateViewHeight 260

@interface TodayViewController ()
{
    ChooseDateView *chooseDateView;
}

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"历史上的今天";
    self.view.backgroundColor = [UIColor colorWithRed:229.0 / 255 green:229.0 / 255 blue:229.0 / 255 alpha:1];
    
    //关闭 navigationBar 半透明效果，让所有subview的起始点坐标在导航栏下方左上角
    self.navigationController.navigationBar.translucent = NO;
    
    //添加选择日期按钮
    _chooseDateButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 60, -5, 50, 50)];
    [_chooseDateButton setImage:[UIImage imageNamed:@"item-all-white@2x.png"] forState:UIControlStateNormal];
    [_chooseDateButton addTarget:self action:@selector(chooseDateAction:) forControlEvents:UIControlEventTouchUpInside];
    _chooseDateButton.hidden = NO;
    [self.navigationController.navigationBar addSubview:_chooseDateButton];
    
    //创建chooseDateView
    [self createChooseDateView];
    
    //请求数据
    [self loadData];
    
}

//隐藏chooseDateView
- (void)hideChooseDateView
{
    chooseDateView.hidden = YES;
}

//显示chooseDateView
- (void)showChooseDateView
{
    chooseDateView.hidden = NO;
}

//选择日期按钮事件
- (void)chooseDateAction:(UIButton *)button
{
    if (!_chooseDateViewShowed)
    {
        _todayTableView.userInteractionEnabled = NO;
        [UIView animateWithDuration:0.3 animations:^{
            //        chooseDateView.hidden = !chooseDateView.hidden;
            chooseDateView.alpha = 1;
            chooseDateView.backView.alpha = 1;
        }];
        _chooseDateViewShowed = YES;
    }else
    {
        _todayTableView.userInteractionEnabled = YES;
        [UIView animateWithDuration:0.3 animations:^{
            //        chooseDateView.hidden = !chooseDateView.hidden;
            chooseDateView.alpha = 0;
            chooseDateView.backView.alpha = 0;
        }];
        _chooseDateViewShowed = NO;
    }
    
    
}

- (void)createChooseDateView
{
    chooseDateView = [[ChooseDateView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kChooseDateViewHeight)];
    
    _chooseDateViewShowed = NO;
    
    [self.view addSubview:chooseDateView];
}

//请求数据
- (void)loadData
{
    NSString *urlString = @"http://api.juheapi.com/japi/toh";
    
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
    
    NSInteger month = components.month;
    NSInteger day = components.day;
    
    NSString *monthStr = [NSString stringWithFormat:@"%ld",month];
    NSString *dayStr = [NSString stringWithFormat:@"%ld",day];
    
    NSDictionary *params = @{
                             @"key" : @"f7a023027fef1ac48a8dc75837facc0a",
                             @"v" : @"1.0",
                             @"month" : monthStr,
                             @"day" : dayStr
                             };
    
    
    [manager POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"请求成功\n%@",responseObject);
//        NSArray *result = responseObject[@"result"];
//        NSDictionary *dic = result[0];
//        NSString *str = dic[@"des"];
//        NSLog(@"%@",str);
        
        [self loadDataFinish:responseObject];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败\n%@",error);
    }];
}

- (void)loadDataFinish:(id)responseObject
{
    NSMutableArray *eventArr = [NSMutableArray array];
    
    NSArray *resultArr = responseObject[@"result"];
    
    for (NSDictionary *dic in resultArr)
    {
        TodayModel *todayModel = [[TodayModel alloc] initWithDictionary:dic error:NULL];
        
//        NSLog(@"%@",todayModel);
        
        //把todayModel传给todayCellLayout，提前计算cell subviews的frame
        TodayCellLayout *cellLayout = [[TodayCellLayout alloc] init];
        cellLayout.todayModel = todayModel;
        
//        NSLog(@"%@",cellLayout.todayModel);
        
        [eventArr addObject:cellLayout];
        
    }
    
    if (eventArr.count > 0)
    {
        _todayTableView.dataArr = eventArr;
        
    }
    
    [_todayTableView reloadData];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [_todayTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    _todayTableView.contentOffset = CGPointMake(0, 0);
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
