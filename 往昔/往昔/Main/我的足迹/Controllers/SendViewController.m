//
//  SendViewController.m
//  往昔
//
//  Created by Macx on 16/2/22.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "SendViewController.h"
#import "FaceView.h"
#import "FontView.h"

@interface SendViewController ()

@property (nonatomic, strong) FaceView *faceView;
@property (nonatomic, strong) FontView *fontView;

@end

@implementation SendViewController

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        
//        
//        _textView.text = [_data objectAtIndex:0];
//        NSLog(@"_data = %@",_data);
//    }
//    return self;
//}

//- (void)keyboardEvent{
//    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
//    
//    
//}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [self.textView becomeFirstResponder];
//    
//}

//- (void)keyboardWillShowNotification:(NSNotification *)noti
//{
//    //配置高度
//
//}

- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length > 0) {
        
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }else{
        
        self.navigationItem.rightBarButtonItem.enabled = NO;
        
        
    }
    

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _textView.delegate = self;
    
    
    [self createView];
    
    
    
    
//    if (_textView.text.length == 0){
//        
//        self.navigationItem.rightBarButtonItem.enabled = NO;
//    
//    }
}

- (void)dealloc
{
    //移除键盘通知的观察者和kvo的观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_faceView.imgFaceView removeObserver:self forKeyPath:@"faceName_kvo"];
}

- (void)createView{
    
    UIButton *backButton = [[UIButton alloc] init];
    [backButton setImage:[UIImage imageNamed:@"JianJiItem"] forState:UIControlStateNormal];
    backButton.showsTouchWhenHighlighted = YES;
    backButton.frame = CGRectMake(kScreenWidth - 60, -5, 50, 50);
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    backButton.tag = 100;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIButton *sendButton = [[UIButton alloc]init];
    [sendButton setImage:[UIImage imageNamed:@"ProExport"] forState:UIControlStateNormal];
    sendButton.showsTouchWhenHighlighted = YES;
    sendButton.frame = CGRectMake(kScreenWidth - 60, -5, 50, 50);
    
    [sendButton addTarget:self action:@selector(sendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    sendButton.tag = 101;
    
    UIBarButtonItem *sendItem = [[UIBarButtonItem alloc] initWithCustomView:sendButton];
    self.navigationItem.rightBarButtonItem = sendItem;

    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _textView.font = [UIFont systemFontOfSize:16];
    
    _textView.backgroundColor = [UIColor whiteColor];
    
    
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    
    NSArray *buttonNames = @[@"ToolsFont",
                             @"ToolsMoreInfo",
                             @"ToolsPaper",
                             @"ToolsPhoto",
                             @"ToolKeyboardHidden"];
    
    float itemWidth = kScreenWidth / 5;
    CGFloat top = 0; // 顶端盖高度
    
    CGFloat bottom = 0 ; // 底端盖高度
    
    CGFloat left = 0; // 左端盖宽度
    
    CGFloat right = 0; // 右端盖宽度
    
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    for (int i = 0; i < buttonNames.count; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(itemWidth * i + 15, 0, itemWidth - 40, 20)];
        
        NSString *string = buttonNames[i];
        
//        button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:string]];
        UIImage *image = [UIImage imageNamed:string];
        image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        

        [button setBackgroundImage:image forState:UIControlStateNormal];
        button.tag = 300 + i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [accessoryView addSubview:button];
        [self.view addSubview:_textView];

    }
    _textView.inputAccessoryView = accessoryView;

}

- (void)buttonAction:(UIButton *)sender{
    switch (sender.tag)
    {
        case 300:
            
            if (!_fontView) {
                
                _fontView = [[FontView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 226, kScreenWidth, 226)];
                
                //将block中的属性赋值给drawView
                [_fontView colorBlock:^(UIColor *color) {
                    
                    _textView.textColor = color;
                    
//                   textString = [NSString stringWithFormat:@"%@",color];
//
                    NSLog(@"%@",_textView.textColor);
                    
                }];
                
                [_fontView lineWidthBlock:^(CGFloat lineWidth) {
                    _textView.font = [UIFont systemFontOfSize:lineWidth];
                    
                    colorString = [NSString stringWithFormat:@"%f",lineWidth];
                }];
                
                
            }
            
            [self.textView resignFirstResponder];
            
            if (self.textView.inputView) {
                
                self.textView.inputView = nil;
                
            }else{
                
                self.textView.inputView = _fontView;
                
            }
            
            [self.textView becomeFirstResponder];

            break;
        case 301:
            
            break;
        case 302:
            
            
            
            
            break;
        case 303:
            if (!_faceView) {
                                _faceView = [[FaceView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
                                //添加观察者
                                [_faceView.imgFaceView addObserver:self forKeyPath:@"faceName_kvo" options:NSKeyValueObservingOptionNew context:NULL];
                            }
                
                            [self.textView resignFirstResponder];
                            if (self.textView.inputView) {
                                self.textView.inputView = nil;
                            }else{
                                self.textView.inputView = _faceView;
                            }
                            [self.textView becomeFirstResponder];
            break;
        case 304:
        {
            
        [_textView resignFirstResponder];
        }
            
            break;
        default:
            break;
    }
    
}
- (void)backButtonAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    //[_textView resignFirstResponder];
}

#warning 观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    NSString *face = [change objectForKey:NSKeyValueChangeNewKey];
    //如果拿到的值是空，记住，在容器类当中 nil是容器的结尾，实际控制[NSNull null]
    if (!face || [face isKindOfClass:[NSNull class]]) {
        return;
    }
    self.navigationItem.rightBarButtonItem.enabled = YES;
    //在光标的位置插入表情, 如果选中, 将会被替换
    NSMutableString *mStr = [NSMutableString stringWithString:_textView.text];
    
    //获取光标的位置
    NSRange rg = _textView.selectedRange;
    if (rg.location == NSNotFound) {
        //如果没有找到光标,就把光标定位到文字结尾
        rg.location = _textView.text.length;
    }
    
    //替换选中的文字
    [mStr replaceCharactersInRange:rg withString:face];
    
    _textView.text = mStr;
    
    //最后再定位光标
    _textView.selectedRange = NSMakeRange(rg.location+face.length, 0);
}

//保存日记
- (void)sendButtonAction:(UIButton *)sender{
    // 3.新建数据
    
        
    
        
    diary = [userData objectForKey:@"Diary"];
    //NSLog(@"name ==%@",diary);
    
    fontColor = [userData objectForKey:@"Color"];
    
//    Textcolor = [userData objectForKey:@"textColor"];
//    
//    if (textString.length == 0) {
//        textString = @"[UIColor blackColor]";
//    }
    
   
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    date = [userData objectForKey:@"date"];
    
    if(_data == nil){
        
        //去掉换行和空白字符
         newString = [_textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
//        newString = [NSString stringWithFormat:@"%@", _textView.text];
        
        //NSLog(@"%@",newString);
        
        [diary addObject:newString];
        
        [date addObject:locationString];
        
        [fontColor addObject:colorString];
        
        NSLog(@"%@",colorString);
        //[Textcolor addObject:textString];
        
        [userData setValue:diary forKey:@"Diary"];
        [userData setValue:date forKey:@"date"];
        [userData setValue:fontColor forKey:@"Color"];
        //[userData setValue:Textcolor forKey:@"textColor"];
        [userData writeToFile:fileName atomically:YES];
        
    }else{
    
        NSString *changeString =[_textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//        NSArray *newArray = [NSArray array];
//        
//        newArray = diary;
        
        [diary replaceObjectAtIndex:_indexPath.row withObject:changeString];
        
        [fontColor replaceObjectAtIndex:_indexPath.row withObject:colorString];
        
//        newArray[_indexPath] = _textView.text;
        
        [userData setValue:diary forKey:@"Diary"];
        [userData setValue:fontColor forKey:@"Color"];
        [userData writeToFile:fileName atomically:YES];
       
    }
    
    
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:nil message:@"保存成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    alert1.tag = 100;
    [alert1 show];

}

//读取plist数据
- (void)LoadPlist
{
    // 1.获得沙盒根路径
    NSString *home = NSHomeDirectory();
    
    // 2.document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    
    
    //取得完整的文件名
    fileName=[docPath stringByAppendingPathComponent:@"users.plist"];
    //NSLog(@"fileName is%@",fileName);
    
    userData = [[NSMutableDictionary alloc]initWithContentsOfFile:fileName];
    
    //NSLog(@"user =%@",userData);
    
    diary= [userData objectForKey:@"Diary"];
    //NSLog(@"diary ==%@",diary);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextViewDelegate
//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textViewDidBeginEditing:(UITextView *)textView DidBeginEditing:(UITextField *)textField
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
//-(BOOL)textViewShouldReturn:(UITextView *)textView
//{
//    [textView resignFirstResponder];
//    return YES;
//}
//-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
//{
//    
//    if ([_textView.text isEqualToString:@"\n"]) {
//        
//        [textView resignFirstResponder];
//        
//        return NO;
//        
//    }
//    
//    return YES;    
//    
//}
//输入框编辑完成以后，将视图恢复到原始状态
-(void)textViewDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

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
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self LoadPlist];
    
    _textView.text = [_data objectAtIndex:0];
    
    NSString *newWide = [_wideData objectAtIndex:0];
    if (newWide.length == 0) {
        
        _textView.font = [UIFont systemFontOfSize:15];
    }else{
        _textView.font = [UIFont systemFontOfSize:[newWide floatValue]];
    }
    
    if (colorString.length == 0) {
//        
        if(_textView.text.length == 0){
//            
            colorString = @"15";
//            
        }else{
//
            
      CGFloat f= [_textView.font pointSize];
            
    colorString = [NSString stringWithFormat:@"%f",f];
//            _textView.font = [UIFont systemFontOfSize:[colorString floatValue]];
            
            
            
        //NSLog(@"%@",colorString);
//            
        }
    }
    //index = _indexPath.length;
    //NSLog(@"_data = %@",_textView.text);
    //rNSLog(@"index = %ld",(long)_indexPath.row);
}
@end
