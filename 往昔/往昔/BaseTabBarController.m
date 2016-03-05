//
//  BaseTabBarController.m
//  往昔
//
//  Created by 干晨威 on 16/2/5.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()
{
    UIImageView *_selectItem;  //标签栏的选中效果图
    UIView *_customTabBar;  //自定义tabBar
}

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建四个viewControllers
    [self createViewControllers];
    
    //创建自定义tabBar
    [self createTabBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self removeUITabBarButton];
    
    [self showTabBar];
}

//移除自带的tabBarButton
-(void)removeUITabBarButton
{
    for (UIView *view in self.tabBar.subviews)
    {
        //判断是否是系统自带的button
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            [view removeFromSuperview];
        }
    }
    
    self.tabBar.hidden = YES;
}

//创建四个viewControllers
- (void)createViewControllers
{
    NSArray *storyBoardNames = @[@"Today",@"Mine",@"Taste",@"More"];
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:storyBoardNames.count];
    
    for (int i = 0; i < storyBoardNames.count; i++)
    {
        NSString *storyBoardName = storyBoardNames[i];
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
        UIViewController *viewController = [storyBoard instantiateInitialViewController];
        [viewControllers addObject:viewController];
    }
    
    self.viewControllers = viewControllers;
    
//    NSLog(@"%@",self.viewControllers);
}

//创建自定义tabBar
- (void)createTabBar
{
    float itemWidth = kScreenWidth / 4;
    
    _customTabBar = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49)];
//    customTabBar.backgroundColor = [UIColor colorWithRed:30.0 / 255 green:144.0 / 255 blue:255.0 / 255 alpha:1];
    _customTabBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_customTabBar];
    
    //tabBar按钮图片名数组
    NSArray *buttonImgNames = @[
                                @"item-today@2x.png",
                                @"item-note@2x.png",
                                @"item-star@2x.png",
                                @"item-more@2x.png"
                                ];
    NSArray *buttonSelectedImgNames = @[
                                        @"item-today-selected@2x.png",
                                        @"item-note-selected@2x.png",
                                        @"item-star-selected@2x.png",
                                        @"item-more-selected@2x.png"
                                        ];
    
    for (int i = 0; i < buttonImgNames.count; i++)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * itemWidth, 0, itemWidth, 49)];
        button.tag = 100 + i;
        [button setImage:[UIImage imageNamed:buttonImgNames[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:buttonSelectedImgNames[i]] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        [_customTabBar addSubview:button];
        
        if (i == 0)
        {
            button.selected = YES;
        }
    }
    
}

//tabBar按钮选中事件，切换页面
- (void)selectButton:(UIButton *)sender
{
    //选中一个按钮时把其他按钮的选中状态置为NO
    for (UIButton *button in _customTabBar.subviews)
    {
        if (button.tag != sender.tag)
        {
            button.selected = NO;
        }
    }
    
    sender.selected = YES;
    
    self.selectedIndex = sender.tag - 100;
    
    
}

//隐藏tabBar
- (void)hideTabBar
{
    _customTabBar.hidden = YES;
}

//显示tabBar
- (void)showTabBar
{
    _customTabBar.hidden = NO;
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
