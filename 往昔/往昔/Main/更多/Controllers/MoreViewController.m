//
//  MoreViewController.m
//  往昔
//
//  Created by 林亮亮 on 16-2-1.
//  Copyright (c) 2015年 林亮亮. All rights reserved.
//

#import "MoreViewController.h"
#import "LogInViewController.h"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad{
    [super viewDidLoad];

    self.title = @"更多";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //self.tableView.separatorColor = [UIColor blueColor];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage_HL"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)countCacheSize
{
    NSUInteger fileSize = [[SDImageCache sharedImageCache]getSize];
    _countLabel.text = [NSString stringWithFormat:@"%.1f M",fileSize / 1024 /1024.0];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self countCacheSize];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"清除缓存" message:@"确定要清空缓存吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag = 200;
        [alertView show];
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 200 && buttonIndex == 1) {
        
        [[SDImageCache sharedImageCache]clearDisk];
        [self countCacheSize];
        
    }else if(alertView.tag == 100 && buttonIndex == 1){
        
        UIAlertView *alert4 = [[UIAlertView alloc]initWithTitle:nil message:@"正在离开" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        alertView.tag = 400;
        
        [alert4 show];
        
        NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
        
//        if ([userDefatluts objectForKey:@"Name"] != nil) {
        
//                    [userDefaults removeObjectForKey:@"Name"];
//            
//                    [userDefaults synchronize];
            
            [userDefatluts removeObjectForKey:@"Name"];
            
            [userDefatluts synchronize];
            
        
       // }
        
        [self performSelector:@selector(showMain) withObject:nil afterDelay:2.0f];
       //[self showMain];
        
        
}
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)showMain{
    
    exit(0);
//    
////    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    
//    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"LogIn" bundle:nil];
//    
//    LogInViewController *logInController = [mainStoryboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
//    
//    self.appDelegate

//    UIWindow *window = self.view.window;
//    
//    window.rootViewController = logInController;
//    SendViewController *detailViewController=
//    [[SendViewController alloc]init];
//    
//    //将新建的DiaryContent实例赋给DetailViewController对象
//    //[detailViewController setDiary:newDiary];
//    
//    //    [[self navigationController]pushViewController:detailViewController animated:YES];
//    BaseNavigationController *root = [[BaseNavigationController alloc]initWithRootViewController:detailViewController];
//    
//    [self presentViewController:root animated:YES completion:NULL];
    
    
        //LogInViewController *logInViewController = [;
    

}
- (IBAction)logOut:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登出" message:@"要登出并退出程序吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.tag = 100;
    [alert show];
}

@end
