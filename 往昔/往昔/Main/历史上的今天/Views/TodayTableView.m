//
//  TodayTableView.m
//  往昔
//
//  Created by 干晨威 on 16/2/6.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "TodayTableView.h"
#import "ChooseDateView.h"
#import "TodayDetailViewController.h"
#import "BaseNavigationController.h"
#import "OldCalenderViewController.h"
#import "WeatherViewController.h"

#define kHeadViewHeight 220

@implementation TodayTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.delegate = self;
        self.dataSource = self;
        
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.delegate = self;
    self.dataSource = self;
    
    [self registerNib:[UINib nibWithNibName:@"TodayCell" bundle:nil] forCellReuseIdentifier:@"todayCell"];
    
    self.backgroundColor = [UIColor colorWithRed:229.0 / 255 green:229.0 / 255 blue:229.0 / 255 alpha:1];
    
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self createHeadView];
    
}

- (void)createHeadView
{
    NSArray *imageURLs = @[@"oldcalender.gif", @"weather.png", @"oldcalender.gif"];
    NSArray *titles = @[@"看老黄历，迎吉避凶", @"查询天气，放心出行", @"bbbbb"];
    
    _headView = [AdView adScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kHeadViewHeight) localImageLinkURL:imageURLs pageControlShowStyle:UIPageControlShowStyleLeft];
    [_headView setAdTitleArray:titles withShowStyle:AdTitleShowStyleRight];
    _headView.adMoveTime = 4.0;
    _headView.centerAdLabel.textColor = [UIColor whiteColor];
    
    //点击图片回调的block
    __weak typeof(self) weakSelf = self;
    _headView.callBack = ^(NSInteger index,NSString * imageURL)
    {
        NSLog(@"被点中图片的索引:%ld---地址:%@",(long)index,imageURL);
        
        [weakSelf headViewTapAction:index];
        
    };
    
    self.tableHeaderView = _headView;
}


- (void)headViewTapAction:(NSInteger)index
{
    switch (index)
    {
        case 0:
        {
            OldCalenderViewController *oldVC = [[OldCalenderViewController alloc] init];
            
            [self.navigationController pushViewController:oldVC animated:YES];
        }
            break;
        case 1:
        {
            WeatherViewController *weatherVC = [[WeatherViewController alloc] init];
            
            [self.navigationController pushViewController:weatherVC animated:YES];
        }
        default:
            break;
    }
}

- (UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
    }
    
    return nil;
}

- (UINavigationController *)navigationController
{
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UINavigationController class]]) {
            
            return (UINavigationController *)next;
        }
        
        next = next.nextResponder;
    }
    
    return nil;
}

#pragma - mark UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todayCell" forIndexPath:indexPath];
    cell.cellLayout = _dataArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodayCellLayout *cellLayout = _dataArr[indexPath.row];
    
    return cellLayout.cellHeight;
}

//单元格选中事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseNavigationController *todayNavigationController = [UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0];
    
    TodayDetailViewController *todayDetailViewController = [[TodayDetailViewController alloc] init];
    
    TodayCellLayout *cellLayout = _dataArr[indexPath.row];
    
    todayDetailViewController.todayDetailView.eventId = cellLayout.todayModel._id;
    
    [todayNavigationController pushViewController:todayDetailViewController animated:YES];
}

@end
