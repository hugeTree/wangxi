//
//  PhotoTableView.m
//  往昔
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "PhotoTableView.h"
#import "PhotoViewCell.h"
#import "OldPhotoLayout.h"
#import "WebViewController.h"
#import "UIView+ViewController.h"

#define photoCell @"photoCell"

@implementation PhotoTableView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _mutData = [[NSMutableArray alloc] init];
        
        self.backgroundColor = [UIColor colorWithRed:229.0 / 255 green:229.0 / 255 blue:229.0 / 255 alpha:1];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[PhotoViewCell class] forCellReuseIdentifier:photoCell];
        
    }
    return self;
}

#pragma -mark -UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    NSLog(@"%ld", self.data.count);
    return self.mutData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OldPhotoLayout *layout = self.mutData[indexPath.row];
//    NSLog(@"%f", layout.cellHeight);
    return layout.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:photoCell forIndexPath:indexPath];
    
    cell.layoutFrame = self.mutData[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WebViewController *webVC = [[WebViewController alloc] init];
    
    OldPhotoLayout *layout = self.mutData[indexPath.row];
    webVC.url = layout.disModel.url;
    
    [self.viewController.navigationController pushViewController:webVC animated:YES];
//    [self.viewController performSegueWithIdentifier:<#(nonnull NSString *)#> sender:<#(nullable id)#>];
    
    [self deselectRowAtIndexPath:indexPath animated:YES];
}

@end
