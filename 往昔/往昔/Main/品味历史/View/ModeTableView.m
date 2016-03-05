//
//  ModeTableView.m
//  往昔
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "ModeTableView.h"

@implementation ModeTableView 

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (!_airlines) {
            _airlines = [NSMutableArray array];
            
        }
        [self _createHeaderView];
        
        self.backgroundColor = [UIColor whiteColor];
//        self.alwaysBounceVertical = YES;
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(void)setAirlines:(NSMutableArray *)airlines {
    
    if (_airlines != airlines) {
        _airlines = airlines;
    }
}

- (void)_createHeaderView {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    
    label.text = @"     热门搜索";
    label.backgroundColor = [UIColor lightGrayColor];
    
    self.tableHeaderView = label;
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.airlines.count >= 8) {
        
        return 8;
    }
    
    return self.airlines.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = self.airlines[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 5;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    [self.searchController.searchBar resignFirstResponder];
//    
//    SearchViewController *searchVC = [[SearchViewController alloc] init];
//    
//    searchVC.searchName = self.airlines[indexPath.row];
//    
//    NSLog(@"%@", self.viewController);
//    
//    [self.viewController.navigationController pushViewController:searchVC animated:YES];
//    
//    [self deselectRowAtIndexPath:indexPath animated:YES];
//    
//    [self.viewController dismissViewControllerAnimated:YES completion:^{
//        
//    }];
//    
//}

@end
