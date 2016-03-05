//
//  LogInViewController.m
//  往昔
//
//  Created by Macx on 16/2/20.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "LogInViewController.h"
#import "BaseTabBarController.h"
#import "RegisteredViewController.h"
#import "BaseNavigationController.h"

@interface LogInViewController ()
{
    NSMutableDictionary *userData;
    NSArray *name;
    NSArray *password;

}
@end

@implementation LogInViewController

- (void)viewDidLoad {
    
   
 
    [super viewDidLoad];
    [self createNavi];
    //self.title = @"我的足迹";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavi{
    
    //    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"注册" forState:UIControlStateNormal];
        button.showsTouchWhenHighlighted = YES;
        button.frame = CGRectMake(kScreenWidth - 60, -5, 50, 50);
        [button addTarget:self action:@selector(registered:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 3000;
        [self.navigationController.navigationBar addSubview:button];
//        [titleView addSubview:button];
//        self.navigationItem.titleView = titleView;
    
    nameText.font = [UIFont fontWithName:@"Arial" size:16.0f];
    nameText.placeholder = @"请输入用户名";
    nameText.borderStyle = UITextBorderStyleLine;
    
    passwordText.font = [UIFont fontWithName:@"Arial" size:16.0f];
    passwordText.placeholder = @"请输入密码";
    passwordText.borderStyle = UITextBorderStyleLine;
    passwordText.secureTextEntry = YES;
    
    imageView.image = [UIImage imageNamed:@"JianJi"];
    
    //imageView.contentMode = UIViewContentModeScaleAspectFit;
    
   
    
}

//- (void)MineButtonAction:(UIButton *)sender{
//    
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"请先登陆" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alert show];
//    
//    
//}

//读取plist数据
- (void)LoadPlist
{
    // 1.获得沙盒根路径
    NSString *home = NSHomeDirectory();
    
    // 2.document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    
    
    //取得完整的文件名
    NSString *fileName=[docPath stringByAppendingPathComponent:@"users.plist"];
    NSLog(@"fileName is%@",fileName);
    userData = [[NSMutableDictionary alloc]initWithContentsOfFile:fileName];
    //NSLog(@"%@",userData);
    
    name= [userData objectForKey:@"Name"];
   // NSLog(@"name ==%@",name);
    password= [userData objectForKey:@"Password"];
    //NSLog(@"P ==%@",password);
    
    if(userData == nil)
    {
        //1. 创建一个plist文件
        NSFileManager* fm = [NSFileManager defaultManager];
        [fm createFileAtPath:fileName contents:nil attributes:nil];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        NSArray *array1=[[NSArray alloc]initWithObjects:@"a",nil];
        NSArray *array2=[[NSArray alloc]initWithObjects:@"1", nil];
        NSArray *array3=[[NSArray alloc]init];
        NSArray *array4=[[NSArray alloc]init];
         NSArray *array5=[[NSArray alloc]init];
//         NSArray *array6=[[NSArray alloc]init];
        [dic setValue:array1 forKey:@"Name"];
        [dic setValue:array2 forKey:@"Password"];
        [dic setValue:array3 forKey:@"Diary"];
        [dic setValue:array4 forKey:@"date"];
        [dic setValue:array5 forKey:@"Color"];
//        [dic setValue:array5 forKey:@"textColor"];
        
        [dic writeToFile:fileName atomically:YES];
    }

}
//
- (IBAction)logIn:(id)sender {
    
    BOOL index = NO;
    for (int i = 0; i < name.count; i++) {
        
       NSString *nameString = [name objectAtIndex:i];
        
       NSString *passwordString = [password objectAtIndex:i];
    
    //NSLog(@"%@",nameString);
   // NSLog(@"%@",passwordString);
    
    if ([nameText.text isEqualToString:nameString] && [passwordText.text isEqualToString: passwordString]){
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        //登录成功后把用户名和密码储存到UserDefault
        //NSString *string = [userDefaults stringForKey:@"Name"];
        
        if ([userDefaults stringForKey:@"Name"] == nil) {
            
            [userDefaults setObject:nameString forKey:@"Name"];
            //        [userDefaults setObject:passwordString forKey:@"Password"];
            [userDefaults synchronize];
            index = YES;
            
            [self showMain];

        }//else{
//        
//            
//        
//        }
//        
//        
        }
    }
    if(!index){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"用户名或密码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
//        index = YES;
        
    }
}
- (void)registered:(UIButton *)sender {
    
    RegisteredViewController *regViewController = [[RegisteredViewController alloc]init];
//    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"LogIn" bundle:nil];
//    
//    RegisteredViewController *regViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"RegisteredViewController"];
    
    BaseNavigationController *root = [[BaseNavigationController alloc]initWithRootViewController:regViewController];
    
    [self presentViewController:root animated:YES completion:NULL];
    
}

-(void)showMain
{
    
    BaseTabBarController *baseTabBarController = [[BaseTabBarController alloc] init];
//    //1、加载storyBoard
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    //2、取得故事版中第一个控制器对象
//    UIViewController *viewController = [storyBoard instantiateInitialViewController];
    //2、取得window对象
    UIWindow *window = self.view.window;
    //把第一个控制器添加到window上显示
    window.rootViewController = baseTabBarController;
    
    
}
#pragma mark - UITextFileDelegate
//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self LoadPlist];
    nameText.text = nil;
    passwordText.text = nil;
}
@end
