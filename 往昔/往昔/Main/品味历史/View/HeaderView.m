//
//  HeaderView.m
//  Discover
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

- (void)setSearchBar:(UISearchBar *)searchBar {
    
    if (searchBar) {
        _searchBar = searchBar;
        
        _searchBar.frame = CGRectMake(0, 0, kScreenWidth, 44);
        
        [self addSubview:_searchBar];
    }
}

@end
