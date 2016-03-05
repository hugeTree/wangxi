//
//  WeatherView.m
//  往昔
//
//  Created by 干晨威 on 16/2/22.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "WeatherView.h"
#import "TodayWeatherModel.h"
#import "BaseViewController.h"
#import "WeatherHeadView.h"
#import "WeatherViewController.h"
#import "WeatherFutureView.h"
#import "LifeView.h"

@interface WeatherView () <UIScrollViewDelegate>
{
    WeatherHeadView *weatherHeadView;
    
    UILabel *future;
    
    UILabel *life;
    
    WeatherFutureView *weatherFutureView;
    
    LifeView *lifeView;
}

@end

@implementation WeatherView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        self.delegate = self;
        self.dataSource = self;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = YES;
        
        _todayDataArr = [NSMutableArray array];
        _futureDataArr = [NSMutableArray array];
        _lifeDataArr = [NSMutableArray array];
        
//        [self createHeadView];
        
//        [self becomeFirstResponder];
    }
    return self;
}

- (WeatherViewController *)weatherViewController
{
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[WeatherViewController class]]) {
            
            return (WeatherViewController *)next;
        }
        
        next = next.nextResponder;
    }
    
    return nil;
}

- (void)setLifeDataArr:(NSMutableArray *)lifeDataArr
{
    if (_lifeDataArr != lifeDataArr)
    {
        _lifeDataArr = lifeDataArr;
        
        
    }
}

#pragma - mark UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"today:%ld",(unsigned long)_todayDataArr.count);
    NSLog(@"future:%ld",(unsigned long)_futureDataArr.count);
    NSLog(@"life:%ld",(unsigned long)_lifeDataArr.count);
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 280;
    }else if (indexPath.row == 1)
    {
        return 200;
    }else
    {
        return 400;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        UITableViewCell *headCell = [[UITableViewCell alloc] init];
        headCell.backgroundColor = [UIColor clearColor];
        headCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        headCell.backgroundColor = [UIColor redColor];
        CGFloat futureY = 280 - 20;
        future = [[UILabel alloc] initWithFrame:CGRectMake(0, futureY, 100, 20)];
        future.text = @"未来天气";
        future.textAlignment = NSTextAlignmentCenter;
        future.font = [UIFont systemFontOfSize:18];
        future.textColor = [UIColor whiteColor];
        future.alpha = 0;
//        future.backgroundColor = [UIColor blackColor];
        
        NSLog(@"future = %@", future);
        
        [headCell.contentView addSubview:future];
        
        return headCell;
    }else if (indexPath.row == 1)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGFloat lifeY = 200 - 20;
        life = [[UILabel alloc] initWithFrame:CGRectMake(0, lifeY, 100, 20)];
        life.text = @"生活提示";
        life.textAlignment = NSTextAlignmentCenter;
        life.font = [UIFont systemFontOfSize:18];
        life.textColor = [UIColor whiteColor];
        life.alpha = 0;
        
        [cell addSubview:life];
        
        weatherFutureView = [[WeatherFutureView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        
        weatherFutureView.dataArr = _futureDataArr;
        
        [cell.contentView addSubview:weatherFutureView];
        
        
        return cell;
    }else
    {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        lifeView = [[LifeView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 400)];
        [cell.contentView addSubview:lifeView];
        
//        lifeView.scrollEnabled = NO;
        
        if (_lifeDataArr.count > 0)
        {
            LifeModel *lifeModel = _lifeDataArr[0];
            lifeView.lifeModel = lifeModel;
        }
        
        
        return cell;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    NSLog(@"返回的view:%@",[self hitTest:point withEvent:event]);
}

#pragma - mark UIScrollView Delegate
#warning 这里的144和120是6sPlus上的数据 换做其他型号的时候需要调整
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset = scrollView.contentOffset.y;
    
//    NSLog(@"yOffset = %lf", yOffset);
    
    WeatherViewController *weatherViewController = self.weatherViewController;
    
    weatherHeadView = [weatherViewController.view viewWithTag:101];
    
    CGFloat rate = 0;
    if (yOffset >= 0 && yOffset <= 144)  //---向上滑动，头条view缓慢向上移动
    {
        self.scrollEnabled = YES;
        
//        lifeView.scrollEnabled = NO;
        
        CGRect frame = weatherHeadView.frame;
        CGPoint origin = weatherHeadView.frame.origin;
        origin.y = - yOffset * 0.55;
        frame = CGRectMake(origin.x, origin.y, frame.size.width, frame.size.height);
        weatherHeadView.frame = frame;
        
        if (yOffset < 100)
        {
            rate = yOffset / 100;
        }else
        {
            rate = 1.0;
        }
        
        [weatherHeadView chageAlphaForSubViews:rate];
        
        future.alpha = rate;
        life.alpha = rate;
    }else if (yOffset > 144)
    {
        self.scrollEnabled = NO;
//        lifeView.scrollEnabled = YES;
//        [lifeView becomeFirstResponder];
//        [self resignFirstResponder];
    }else
    {
        self.scrollEnabled = NO;
//        [lifeView becomeFirstResponder];
    }
    
}


@end
