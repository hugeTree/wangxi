//
//  MovieCollectionViewCell.m
//  往昔
//
//  Created by mac on 16/2/28.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "MovieCollectionViewCell.h"

@implementation MovieCollectionViewCell

- (void)setData:(MovieModel *)data {
    
    [self setCellSubviewsFrame];
    NSString *urlString = @"http://movie.apix.cn/fun/image/";
    if (_data != data) {
        _data = data;
        
        //图片
        NSMutableString *url = [[NSMutableString alloc] init];
        [url appendString:urlString];
        [url appendString:_data.img];
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:url]];
        //标题
        NSString *name = _data.name;
        NSRange range = [name rangeOfString:@" "];
        NSUInteger index = range.location;
        name = [name substringToIndex:index];
        self.titleLabel.text = name;

        //评分星星
        self.starView.rating = [_data.rating floatValue];
        //评分
        if ([_data.rating floatValue] > 0) {
            
            self.ratingLabel.text = [NSString stringWithFormat:@"%.1f", [_data.rating floatValue]];
        }else {
            
            self.ratingLabel.text = @"7.4";
        }
    }
    
//    [self setCellSubviewsFrame];
}

- (void)setCellSubviewsFrame {
    
    self.imgView.frame = CGRectMake(0, 0, kCellWidth, kCellHeight - 30);
    self.titleLabel.frame = CGRectMake(0, kCellHeight - 60, kCellWidth, 30);
    
    self.starView.frame = CGRectMake(0, kCellHeight - 30, kCellWidth - 40, (kCellWidth - 40) / 5);
    self.ratingLabel.frame = CGRectMake(kCellWidth - 40, kCellHeight - 30, 40, 25);
}

#pragma -mark -懒加载
@synthesize imgView = _imgView;
@synthesize titleLabel = _titleLabel;
@synthesize starView = _starView;
@synthesize ratingLabel = _ratingLabel;

- (UIImageView *)imgView {
    
    if (!_imgView) {
        
        _imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_imgView];
    }
    
    return _imgView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLabel.font = [UIFont systemFontOfSize:kTitleTextFont];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (StarView *)starView {
    
    if (!_starView) {
        
        _starView = [[StarView alloc] initWithFrame:CGRectZero];
        
        _starView.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:_starView];
    }
    
    return _starView;
}

- (UILabel *)ratingLabel {
    
    if (!_ratingLabel) {
        
        _ratingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _ratingLabel.font = [UIFont systemFontOfSize:kRatingTextFont];
        _ratingLabel.textAlignment = NSTextAlignmentRight;
        _ratingLabel.numberOfLines = 0;
        _ratingLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_ratingLabel];
    }
    
    return _ratingLabel;
}

@end
