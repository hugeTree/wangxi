//
//  PhotoViewCell.m
//  往昔
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "PhotoViewCell.h"
#import "UIImageView+WebCache.h"
#import "NSDate+TimeAgo.h"

@implementation PhotoViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setLayoutFrame:(OldPhotoLayout *)layoutFrame {
    
    NSString *urlString = @"http://i1.go2yd.com/image.php";
    NSString *typeStr = @"?type=_228x150";
    NSString *url = @"&url=";
    NSString *newsId = @"&news_id=";
    
    if (_layoutFrame != layoutFrame) {
        _layoutFrame = layoutFrame;
        
        self.bgView.backgroundColor = [UIColor whiteColor];
        self.titleLabel.text = _layoutFrame.disModel.title;
        self.sourceLabel.text = _layoutFrame.disModel.source;
        self.timeLabel.text = [self parseDateStr:_layoutFrame.disModel.date];
        
        if (_layoutFrame.disModel.urls.count == 1) {
        
            for (UIImageView *imgView in self.contentView.subviews) {
                
                if ([imgView isKindOfClass:[UIImageView class]]) {
                    
                    imgView.image = nil;
                }
            }
            
            UIImageView *imgView = self.imgViewArr[0];
            
            NSString *_str = [urlString stringByAppendingString:typeStr];
            _str = [_str stringByAppendingString:url];
            _str = [_str stringByAppendingString:_layoutFrame.disModel.urls[0]];
            _str = [_str stringByAppendingString:newsId];
            _str = [_str stringByAppendingString:_layoutFrame.disModel.itemId];
        
        
            [imgView sd_setImageWithURL:[NSURL URLWithString:_str]];
        
            _str = nil;

        }else {
        
            for (UIImageView *imgView in self.contentView.subviews) {
                
                if ([imgView isKindOfClass:[UIImageView class]]) {
                    
                    imgView.image = nil;
                }
            }
            
            for (int i = 0; i < _layoutFrame.disModel.urls.count; i++) {
            
                UIImageView *imgView = self.imgViewArr[i];
                
                NSString *_str = [urlString stringByAppendingString:typeStr];
                _str = [_str stringByAppendingString:url];
                _str = [_str stringByAppendingString:_layoutFrame.disModel.urls [i]];
                _str = [_str stringByAppendingString:newsId];
                _str = [_str stringByAppendingString:_layoutFrame.disModel.itemId];
//              NSLog(@"%@", _str);
                [imgView sd_setImageWithURL:[NSURL URLWithString:_str]];
            
                _str = nil;

            }
            
        }
        
        [self setCellSubviewsFrame];
        
    }
    
}

- (void)setCellSubviewsFrame {
    
    self.titleLabel.frame = _layoutFrame.titleFrame;
    self.sourceLabel.frame = _layoutFrame.sourceFrame;
    self.timeLabel.frame = _layoutFrame.timeFrame;
    self.bgView.frame = _layoutFrame.bgFrame;
    
    for (int i = 0; i < _layoutFrame.disModel.urls.count; i++) {
        
        UIImageView *imgView = self.imgViewArr[i];
        imgView.frame = [self.layoutFrame.imgFrameArr[i] CGRectValue];
    }
}

- (NSString *)parseDateStr:(NSString *)dateStr {
    
    //创建格式化日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //日期的格式
    NSString *format = @"E M d HH:mm:ss Z yyyy";
    [formatter setDateFormat:format];
    
    //设置本地化时间
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [formatter setLocale:locale];
    
    NSDate *date = [formatter dateFromString:dateStr];
    
    return [date timeAgo];
}

@synthesize bgView = _bgView;
@synthesize titleLabel = _titleLabel;
@synthesize sourceLabel = _sourceLabel;
@synthesize timeLabel = _timeLabel;

@synthesize imgViewArr = _imgViewArr;

- (UIView *)bgView {
    
    if (!_bgView) {
        
        _bgView = [[UIView alloc] initWithFrame:CGRectZero];
        
        _bgView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_bgView];
    }
    
    return _bgView;
}

- (WXLabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel.wxLabelDelegate = self;
        
        _titleLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        
        _titleLabel.font = [UIFont systemFontOfSize:kTitleTextFont];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor blackColor];
        
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (UILabel *)sourceLabel {
    
    if (!_sourceLabel) {
        
        _sourceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _sourceLabel.numberOfLines = 1;
        _sourceLabel.font = [UIFont systemFontOfSize:kSourceTextFont];
        _sourceLabel.textColor = [UIColor darkGrayColor];
        
        [self.contentView addSubview:_sourceLabel];
    }
    
    return _sourceLabel;
}

- (UILabel *)timeLabel {
    
    if (!_timeLabel) {
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _timeLabel.font = [UIFont systemFontOfSize:kSourceTextFont];
        _timeLabel.numberOfLines = 1;
        _timeLabel.textColor = [UIColor darkGrayColor];
        
        [self.contentView addSubview:_timeLabel];
    }
    
    return _timeLabel;
}

- (NSMutableArray *)imgViewArr {
    
    if (!_imgViewArr) {
        
        _imgViewArr = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 3; i++) {
            
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
            
            [self.contentView addSubview:imgView];
            [_imgViewArr addObject:imgView];
        }
    }
    
    return _imgViewArr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
