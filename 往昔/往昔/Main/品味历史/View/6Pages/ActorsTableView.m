//
//  ActorsTableView.m
//  往昔
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "ActorsTableView.h"
#import "ActorsTableViewCell.h"

#define actorsTableViewCell @"actorsCell"
@implementation ActorsTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataModel = [[MovieModel alloc] init];
        
        [self _createHeaderView];
        self.allowsSelection = NO;
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[ActorsTableViewCell class] forCellReuseIdentifier:actorsTableViewCell];
    }
    return self;
}

- (void)_createHeaderView {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    
    label.text = @"    演职人员表";
    label.font = [UIFont systemFontOfSize:20];
    
    self.tableHeaderView = label;
    
}

#pragma -mark -UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableString *actorsName = [NSMutableString string];
    for (int i = 0; i < _dataModel.actor.count; i++) {
        
        [actorsName appendString:[NSString stringWithFormat:@"%@/", _dataModel.actor[i]]];
    }
    [actorsName deleteCharactersInRange:NSMakeRange(actorsName.length - 1, 1)];
    CGFloat height = [WXLabel getTextHeight:kChineseTitleFont width:kScreenWidth - 40 - kHeadIndent text:actorsName linespace:kLineSpace];
    
    return height + kChineseTitleFont + 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ActorsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:actorsTableViewCell];
    
    cell.data = self.dataModel;
    
    return cell;
}

@end
