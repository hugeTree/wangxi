//
//  ChooseDateView.m
//  往昔
//
//  Created by 干晨威 on 16/2/10.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "ChooseDateView.h"
#import "TodayViewController.h"
#import "TodayTableView.h"

#define kButtonWidth 40
#define kButtonHeigth 40
#define kLastX 30
#define kNextX kScreenWidth - kLastX - kButtonWidth
#define kButtonY 10

#define kMonthLabelWidth 80
#define kMonthLabelHeight 40

#define kDayCounts 31
#define kDaySizeWidth (kScreenWidth - 20) / 7
#define kDaySizeHeight 40

@interface ChooseDateView ()
{
    CGPoint touchBeginPoint;
    CGPoint touchEndPoint;

    TodayViewController *todayViewController;
    
    
}

@end

@implementation ChooseDateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:30.0 / 255 green:144.0 / 255 blue:255.0 / 255 alpha:1];
        
        //创建显示月份的label
        [self createMonthLabel];
        
        //创建上下月按钮
        [self creatArrowButtons];
        
        //创建日期视图
        [self createDateView];
        
        //初始chooseDateView为透明
        self.alpha = 0;
        
        //创建遮挡视图
        [self createBackView];
    }
    return self;
}

//创建遮挡视图
- (void)createBackView
{
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, kScreenWidth, kScreenHeight - self.frame.size.height)];
    _backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    _backView.alpha = 0;
    
    [self addSubview:_backView];
}

//创建每月日期的n个label
- (void)createDateView
{
    int row = 1;
    int column = 1;
    
    for (int i = 0; i < kDayCounts; i++)
    {
        if (i % 7 == 0 && i > 0)
        {
            column++;
            row = 1;
        }
        
        UIButton *dayButton = [[UIButton alloc] initWithFrame:CGRectMake((row - 1) * kDaySizeWidth + 10, (column - 1) * kDaySizeHeight + 50, kDaySizeWidth, kDaySizeHeight)];
        [dayButton setTitle:[NSString stringWithFormat:@"%d", i + 1] forState:UIControlStateNormal];
        dayButton.titleLabel.textColor = [UIColor whiteColor];
        dayButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        dayButton.titleLabel.font = [UIFont systemFontOfSize:20];
        dayButton.tag = 200 + i;
        
        [dayButton addTarget:self action:@selector(dayButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        row++;
        
        [self addSubview:dayButton];
    }
    
    //添加观察者，观察_monnthLabel.text的变化
    [_monthLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    
    //根据当前月份来控制dateView显示的天数
    long nowMonth = [_monthLabel.text integerValue];
    
    [self showDaysInMonth:nowMonth];
    
}

//dayButton事件
- (void)dayButtonAction:(UIButton *)button
{
    NSString *urlString = @"http://api.juheapi.com/japi/toh";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    long month = [_monthLabel.text integerValue];
    NSString *monthStr = [NSString stringWithFormat:@"%ld",month];
    
    long day = button.tag - 200 + 1;
    NSString *dayStr = [NSString stringWithFormat:@"%ld",day];
    
    NSDictionary *params = @{
                             @"key" : @"f7a023027fef1ac48a8dc75837facc0a",
                             @"v" : @"1.0",
                             @"month" : monthStr,
                             @"day" : dayStr
                             };
    
    [manager POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self changeDate:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败\n%@",error);
    }];
}

//切换日期，并请求数据完成后调用的方法
- (void)changeDate:(id)responseObject
{
    //获得todayViewController
    todayViewController = [UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0].childViewControllers[0];
    //调用loadDataFinish来刷新tableView
    [todayViewController loadDataFinish:responseObject];
    
    todayViewController.chooseDateViewShowed = NO;
    todayViewController.todayTableView.userInteractionEnabled = YES;
    
    [_backView removeFromSuperview];
    _backView = nil;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }];
}

//观察者方法，根据选择的月份来控制显示的当月总共的天数
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSString *monthStr = change[@"new"];
    long month = [monthStr integerValue];
    
    [self showDaysInMonth:month];
}

//控制显示天数
- (void)showDaysInMonth:(long)month
{
    UIButton *day31Button = [self viewWithTag:(200 + kDayCounts - 1)];
    UIButton *day30Button = [self viewWithTag:(200 + kDayCounts - 2)];
    
    if (month == 4 || month == 6 || month == 9 || month ==11)
    {
        day31Button.hidden = YES;
        day30Button.hidden = NO;
    }else if (month != 2)
    {
        day31Button.hidden = NO;
        day30Button.hidden = NO;
    }else
    {
        day31Button.hidden = YES;
        day30Button.hidden = YES;
    }
}

//创建上下月按钮
- (void)creatArrowButtons
{
    CGFloat lastX = CGRectGetMinX(_monthLabel.frame) - kButtonWidth;
    UIButton *lastMonthButton = [[UIButton alloc] initWithFrame:CGRectMake(lastX, kButtonY, kButtonWidth, kButtonHeigth)];
    [lastMonthButton setImage:[UIImage imageNamed:@"item-back-white@2x.png"] forState:UIControlStateNormal];
    lastMonthButton.tag = 101;
    [lastMonthButton addTarget:self action:@selector(arrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:lastMonthButton];
    
    CGFloat nextX = CGRectGetMaxX(_monthLabel.frame);
    UIButton *nextMonthButton = [[UIButton alloc] initWithFrame:CGRectMake(nextX, kButtonY, kButtonWidth, kButtonHeigth)];
    [nextMonthButton setImage:[UIImage imageNamed:@"item-next-white@2x.png"] forState:UIControlStateNormal];
    nextMonthButton.tag = 102;
    [nextMonthButton addTarget:self action:@selector(arrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:nextMonthButton];
    
}

//上一月或下一月按钮事件
- (void)arrowButtonAction:(UIButton *)button
{
    long nowMonth = [_monthLabel.text integerValue];
    
//    NSLog(@"%ld",nowMonth);
    
    if (button.tag == 101)
    {
        if (nowMonth == 1)
        {
            long lastMonth = 12;
            _monthLabel.text = [NSString stringWithFormat:@"%ld月",lastMonth];
        }else
        {
            long lastMonth = nowMonth - 1;
            _monthLabel.text = [NSString stringWithFormat:@"%ld月",lastMonth];
        }
        
    }
    
    if (button.tag == 102)
    {
        if (nowMonth == 12)
        {
            long nextMonth = 1;
            _monthLabel.text = [NSString stringWithFormat:@"%ld月",nextMonth];
        }else
        {
            long nextMonth = nowMonth + 1;
            _monthLabel.text = [NSString stringWithFormat:@"%ld月",nextMonth];
        }
    }
}

- (void)createMonthLabel
{
    _monthLabel = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth - kMonthLabelWidth) / 2, kButtonY, kMonthLabelWidth, kMonthLabelHeight)];
    _monthLabel.textColor = [UIColor whiteColor];
    _monthLabel.textAlignment = NSTextAlignmentCenter;
    _monthLabel.font = [UIFont systemFontOfSize:22];
    
    //根据当前时间来获得月份
    // 1.创建当前时间对象
    NSDate *nowDate = [NSDate date];
    // 2.创建日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 3.利用日历对象获取年月日时分秒
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *components =[calendar components:unit fromDate:nowDate];
    
    NSInteger month = components.month;
    
    NSString *monthStr = [NSString stringWithFormat:@"%ld月",month];
    
    _monthLabel.text = monthStr;
    
    [self addSubview:_monthLabel];
    
}


@end
