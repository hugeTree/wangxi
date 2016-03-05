//
//  DiscoverCell.m
//  Discover
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "DiscoverCell.h"
#import "DiscoverModel.h"

@implementation DiscoverCell

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    if (self = [super initWithCoder:coder]) {
        
        [self _createView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _createView];
    }
    return self;
}

- (void)_createView {
    
    CGFloat titleX = self.contentView.bounds.origin.x;
    CGFloat titleY = self.contentView.bounds.origin.y;
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
//    CGFloat imgX = titleX + width / 2 - height / 2;
    //标题的位置设置
    CGRect titleRect = CGRectMake(titleX, titleY + height - 30, width, 20);
    //图片的位置设置
    CGRect imgRect = CGRectMake(titleX, titleY, width, height);
    
    if (!_imgView) {
        
        _imgView = [[UIImageView alloc] initWithFrame:imgRect];
        
        [self.contentView addSubview:_imgView];
    }
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] initWithFrame:titleRect];
        
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_titleLabel];
    }
    
}

- (void)setDisModel:(DiscoverModel *)disModel {
    
    if (_disModel != disModel) {
        _disModel = disModel;
    }
    
    _imgView.image = _disModel.image;
    _titleLabel.text = _disModel.title;
    
}

@end
