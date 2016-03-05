//
//  RegisteredViewController.m
//  往昔
//
//  Created by Macx on 16/2/20.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "RegisteredViewController.h"

@interface RegisteredViewController ()
{
    NSMutableDictionary *userData;
    NSMutableArray *name;
    NSMutableArray *password;
    NSString *newString;
    NSString *newPasswordString;
    NSString *fileName;
    
}
@end

@implementation RegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self LoadPlist];
    [self createView];
    
    newPassword.delegate = self;
    newName.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createView{
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.showsTouchWhenHighlighted = YES;
    button.frame = CGRectMake(kScreenWidth - 60, -5, 50, 50);
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 3000;
    
    [self.navigationController.navigationBar addSubview:button];
    
    newName.font = [UIFont fontWithName:@"Arial" size:16.0f];
    newName.placeholder = @"请输入用户名";
    newName.borderStyle = UITextBorderStyleLine;
    
    newPassword.font = [UIFont fontWithName:@"Arial" size:16.0f];
    newPassword.placeholder = @"请输入密码";
    newPassword.borderStyle = UITextBorderStyleLine;
    newPassword.secureTextEntry = YES;
    
    imageView.image = [UIImage imageNamed:@"JianJi"];
    
    
    
}

- (void)back:(UIButton *)sender{

[self dismissViewControllerAnimated:YES completion:NULL];

}

#pragma mark - UITextFileDelegate
//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 100 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset , self.view.frame.size.width, self.view.frame.size.height);
    
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
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag == 100 && buttonIndex == 0) {
        
    [self dismissViewControllerAnimated:YES completion:NULL];
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
- (void)LoadPlist
{
// 1.获得沙盒根路径
NSString *home = NSHomeDirectory();

// 2.document路径
NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];


//取得完整的文件名
fileName=[docPath stringByAppendingPathComponent:@"users.plist"];
NSLog(@"fileName is%@",fileName);

userData = [[NSMutableDictionary alloc]initWithContentsOfFile:fileName];
name= [userData objectForKey:@"Name"];
//NSLog(@"name ==%@",name);
password= [userData objectForKey:@"Password"];
NSLog(@"P ==%@",fileName);
 //NSLog(@"userDate ==%@",userData);

}
- (IBAction)registered:(id)sender {
    BOOL isOK = NO;
    
//    // 3.新建数据
//    name= [userData objectForKey:@"Name"];
//    NSLog(@"name ==%@",name);
//    password= [userData objectForKey:@"Password"];
//    NSLog(@"P ==%@",password);
    
    //for (int i = 0; i < name.count; i++) {
        
        newString = [NSString stringWithFormat:@"%@", newName.text];
        newPasswordString = [NSString stringWithFormat:@"%@", newPassword.text];
    if (newPassword.text.length != 0 && newName.text.length != 0) {
        if ([name containsObject:newString]) {
            //            NSMutableArray *array = [[NSMutableArray alloc]init];
            UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:nil message:@"用户已存在" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            alert2.tag = 200;
            [alert2 show];
            
        }else{
            [name addObject:newString];
            [password addObject:newPasswordString];
            [userData setValue:name forKey:@"Name"];
            [userData setValue:password forKey:@"Password"];
            [userData writeToFile:fileName atomically:YES];
            //NSLog(@"%@",userData);
            
            UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:nil message:@"注册成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            alert1.tag = 100;
            [alert1 show];
           
            
        }

    
    }else{
        UIAlertView *alert3 = [[UIAlertView alloc]initWithTitle:nil message:@"请输入用户名或密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alert3.tag = 400;
        [alert3 show];

    
    }
        
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self LoadPlist];
}
@end
