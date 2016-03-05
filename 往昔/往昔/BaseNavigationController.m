//
//  BaseNavigationController.m
//  往昔
//
//  Created by 干晨威 on 16/2/5.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationBar.barTintColor = [UIColor colorWithRed:30.0 / 255 green:144.0 / 255 blue:255.0 / 255 alpha:1];
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.interactivePopGestureRecognizer.enabled = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//---根据navigationController的栈顶子视图控制器的preferredStatusBarStyle来修改状态栏类型
//---当一个视图控制器作为一个导航栏的根视图控制器时，在该试图控制器里调用preferredStatusBarStyle是不能更改状态栏的，只能通过它的导航栏控制器来更改，因为此时导航栏跟状态栏已经绑定
- (UIStatusBarStyle)preferredStatusBarStyle
{
    UIStatusBarStyle style = [self.topViewController preferredStatusBarStyle];
    
    return style;
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
