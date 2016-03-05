//
//  MineViewController.m
//  往昔
//
//  Created by Macx on 16/2/21.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "MineViewController.h"
#import "SendViewController.h"
#import "BaseNavigationController.h"
@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:kCommentCellID];
    // Do any additional setup after loading the view.
    
    //_dirayLabel.wxLabelDelegate = self;
    
    [self createNavi];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //self.tableView.separatorColor = [UIColor blueColor];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage_HL"]];
    
    self.title = @"我的足迹";
}


- (void)createNavi{
    
    //    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"JianJiItem"] forState:UIControlStateNormal];
    button.showsTouchWhenHighlighted = YES;
    button.frame = CGRectMake(kScreenWidth - 60, -5, 50, 50);
    [button addTarget:self action:@selector(MineButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 3000;
    [self.navigationController.navigationBar addSubview:button];
    //    [titleView addSubview:button];
    //    self.navigationItem.titleView = titleView;
}

- (void)MineButtonAction:(UIButton *)sender
{
    SendViewController *detailViewController=
    [[SendViewController alloc]init];
    
    //将新建的DiaryContent实例赋给DetailViewController对象
    //[detailViewController setDiary:newDiary];
    
    //    [[self navigationController]pushViewController:detailViewController animated:YES];
    BaseNavigationController *root = [[BaseNavigationController alloc]initWithRootViewController:detailViewController];
    
    [self presentViewController:root animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return diary.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCommentCellID forIndexPath:indexPath];
    
    NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil];
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //创建新的UITableViewCell对象
    if (!cell) {
        cell =array[0];
        
        
        
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    
    //view.backgroundColor = [UIColor grayColor];
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"point"]];
    image1.frame = CGRectMake(0, 0, 170, 60);
    image1.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:image1];
    
    UIImageView *image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backImage"]];
    image2.frame = CGRectMake(110, 0, kScreenWidth - 110, 60);
    image2.contentMode = UIViewContentModeScaleToFill;
    [view addSubview:image2];
    [cell setBackgroundView:view];
    
    cell.backgroundColor = [UIColor clearColor];
    
   
    
   // UILabel *timeLabel=(UILabel *)[cell viewWithTag:99];
    
   // _dirayLabel=(WXLabel *)[cell viewWithTag:9];
//if (!_dirayLabel) {
    
    
    _dirayLabel = [[WXLabel alloc]initWithFrame:CGRectMake(120, 20, 0, 0)];
    
    _dirayLabel.wxLabelDelegate = self;
    
    //_dirayLabel.backgroundColor = [UIColor blueColor];
    
    _dirayLabel.text = [diary objectAtIndex:indexPath.row];
    
//    _dirayLabel.textColor =(UIColor *) [Textcolor objectAtIndex:indexPath.row];
   
    NSString *f = [fontColor objectAtIndex:indexPath.row];
    
    
    _dirayLabel.font= [UIFont systemFontOfSize:[f floatValue]];
    
    [cell.contentView addSubview: _dirayLabel];
    
    
    //


//}
    _timeLabel = [[WXLabel alloc]initWithFrame:CGRectMake(0, 20, 0, 0)];
    _timeLabel.text = [date objectAtIndex:indexPath.row];
    
    [cell.contentView addSubview:_timeLabel];
    //[self dirayLabel];
    
    if(_dirayLabel.text.length > 20){
        NSString *string = [NSString stringWithFormat:@"%@",_dirayLabel.text];
        
        NSString *string2 = [string substringToIndex:20]
;
        NSString *string3 = [string2 stringByAppendingString:@"...."];
        
        _dirayLabel.text = string3;
            //_dirayLabel.text = substringWithRange:NSMakeRange(4,2)
    
    
    }
//    timeLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"point.png"]];
//    
//    timeLabel.contentMode = UIViewContentModeScaleAspectFill;
//    dirayLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backImage"]];
    
    [_dirayLabel sizeToFit];
    [_timeLabel sizeToFit];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = [diary objectAtIndex:indexPath.row];
    NSMutableArray *data = [NSMutableArray array];
    
    [data addObject:string];
    
    NSString *wide = [fontColor objectAtIndex:indexPath.row];
    
    NSMutableArray *wideData = [NSMutableArray array];
    
    [wideData addObject:wide];
    
    SendViewController *detailViewController=
    [[SendViewController alloc]init];
    
    detailViewController.data = data;
    
    detailViewController.indexPath = indexPath;
    
    detailViewController.wideData = wideData;
    //NSLog(@"text %@",detailViewController.data);
    
    BaseNavigationController *root = [[BaseNavigationController alloc]initWithRootViewController:detailViewController];
    
    [self presentViewController:root animated:YES completion:NULL];
}

//删除日记
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //如果UITableView对象请求确认的是删除操作……
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [diary removeObjectAtIndex:[indexPath row]];
        [date removeObjectAtIndex:[indexPath row]];
        [fontColor removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
        
        [userData setValue:diary forKey:@"Diary"];
        [userData setValue:date forKey:@"date"];
        [userData setValue:fontColor forKey:@"Color"];
        [userData writeToFile:fileName atomically:YES];
    }
    
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
    date= [userData objectForKey:@"date"];
    //NSLog(@"date ==%@",date);
    fontColor = [userData objectForKey:@"Color"];
    
    //Textcolor = [userData objectForKey:@"textColor"];
    
}

#pragma mark - 懒加载
//@synthesize dirayLabel = _dirayLabel;
//
//-(UILabel *)dirayLabel
//{
////    if (!_dirayLabel) {
//    
//        _dirayLabel.wxLabelDelegate = self;
//    
//        //[self.contentView addSubview:_weiboTextLabel];
//    //}
//    
//    return _dirayLabel;
//}
#pragma mark - WXLabel Delegate
//返回正则表达式匹配的字符串
- (NSString *)contentsOfRegexStringWithWXLabel:(WXLabel *)wxLabel {
    
    NSString *regEx1 = @"http://([a-zA-Z0-9_.-]+(/)?)+";
    
    NSString *regEx2 = @"@[\\w.-]{2,30}";
    NSString *regEx3 = @"#[^#]+#";
    
    NSString *regEx =
    [NSString stringWithFormat:@"(%@)|(%@)|(%@)", regEx1, regEx2, regEx3];
    
    return regEx;
}

- (NSString *)imagesOfRegexStringWithWXLabel:(WXLabel *)wxLabel
{
    return @"\\[\\w+\\]";
}

- (void)toucheEndWXLabel:(WXLabel *)wxLabel withContext:(NSString *)context
{
    NSLog(@"%@", context);
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:context]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:context]];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self LoadPlist];
    [[self tableView]reloadData];
    
    
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
