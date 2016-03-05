//
//  MovieDetailsViewController.m
//  往昔
//
//  Created by mac on 16/2/28.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "PosterView.h"
#import "ActorsTableView.h"

@interface MovieDetailsViewController ()
{
    UIScrollView *_scrollView;
}

@end

@implementation MovieDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _createScrollView];
    
    [self _createBackButton];
}

- (void)_createScrollView {
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
//    _scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight * 5);
    
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_scrollView];
    
    [self _createSubviews];
}

- (void)_createSubviews {
    //海报视图
    PosterView *posterView = [[PosterView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20 + kPosterHeight)];
    posterView.data = self.data;
    
    [_scrollView addSubview:posterView];
    //演职表
    NSMutableString *actorsName = [NSMutableString string];
    for (int i = 0; i < _data.actor.count; i++) {
        
        [actorsName appendString:[NSString stringWithFormat:@"%@/", _data.actor[i]]];
    }
    [actorsName deleteCharactersInRange:NSMakeRange(actorsName.length - 1, 1)];
    CGFloat cellLabelHeight = [WXLabel getTextHeight:kChineseTitleFont width:kScreenWidth - 40 - kHeadIndent text:actorsName linespace:kLineSpace];
    
    ActorsTableView *tableView = [[ActorsTableView alloc ]initWithFrame:CGRectMake(0, 20 + kPosterHeight + 20, kScreenWidth, cellLabelHeight + kChineseTitleFont + 100)];
    tableView.dataModel = self.data;
    
    [_scrollView addSubview:tableView];
    //剧情
    NSString *slotStr = [NSString stringWithString:_data.slot];
    slotStr = [NSString stringWithFormat:@"        %@", slotStr];
    CGFloat slotLabelHeight = [WXLabel getTextHeight:kSlotTextFont width:kScreenWidth - 40 text:slotStr linespace:kLineSpace];
    
    UIView *slotView = [[UIView alloc] initWithFrame:CGRectMake(0, tableView.frame.origin.y + tableView.frame.size.height + 20, kScreenWidth, slotLabelHeight + 20)];
    
    slotView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:slotView];
    
    UILabel *slotLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, kScreenWidth - 40, slotLabelHeight)];
    slotLabel.text = slotStr;
    slotLabel.textColor = [UIColor blackColor];
    slotLabel.font = [UIFont systemFontOfSize:kSlotTextFont];
    slotLabel.numberOfLines = 0;
    
    [slotView addSubview:slotLabel];
    
    _scrollView.contentSize = CGSizeMake(kScreenWidth, slotView.frame.origin.y + slotLabelHeight + 20);
}

- (void)_createBackButton {
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [backButton setImage:[UIImage imageNamed:@"item-back-white@2x.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = backItem;
    
}

- (void)backButtonAction:(UIButton *)button {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)viewWillAppear:(BOOL)animated {
//    
//    BaseTabBarController *baseTabBarController = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//    
//    [baseTabBarController hideTabBar];
//    
//}

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
