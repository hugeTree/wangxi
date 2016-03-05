//
//  PosterView.m
//  往昔
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "PosterView.h"

@implementation PosterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setData:(MovieModel *)data {
    
    if (_data != data) {
        _data = data;
        
        [self _createSubviews];
    }
}

- (void)_createSubviews {
    
    //海报图片
    NSString *urlString = @"http://movie.apix.cn/fun/image/";
    NSMutableString *url = [[NSMutableString alloc] init];
    [url appendString:urlString];
    [url appendString:self.data.img];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, kPosterWidth, kPosterHeight)];
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:url]];
    [self addSubview:imgView];
    
    //标题
    NSString *name = _data.name;
    NSRange range = [name rangeOfString:@" "];
    NSUInteger index = range.location;
    NSString *chineseName = [name substringToIndex:index];
    NSString *englishName = [name substringFromIndex:index];
    
    CGFloat heightCh = [WXLabel getTextHeight:kChineseTitleFont width:kExplainWidth text:[NSString stringWithFormat:@"中文名：%@", chineseName] linespace:kLineSpace];
    CGFloat heightEn = [WXLabel getTextHeight:kEnglishTitleFont width:kExplainWidth text:[NSString stringWithFormat:@"English Name:%@", englishName] linespace:kLineSpace];
    //中文标题
    UILabel *chineseTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kExplianX, 10, kExplainWidth, heightCh)];
    chineseTitleLabel.text = [NSString stringWithFormat:@"中文名：%@", chineseName];
    chineseTitleLabel.numberOfLines = 0;
    chineseTitleLabel.textColor = [UIColor blackColor];
    [self addSubview:chineseTitleLabel];
    //英文标题
    //    UILabel *englishTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kExplianX, 10 + heightCh, kExplainWidth, heightEn)];
    UILabel *englishTitleLabel = [[UILabel alloc] init];
    englishTitleLabel.text = [NSString stringWithFormat:@"English Name:%@", englishName];
    englishTitleLabel.numberOfLines = 0;
    englishTitleLabel.textColor = [UIColor blackColor];
    [self addSubview:englishTitleLabel];
    
    //时长
    //    UILabel *runtimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kExplianX, 10 + heightCh + heightEn, kExplainWidth, kChineseTitleFont)];
    UILabel *runtimeLabel = [[UILabel alloc] init];
    runtimeLabel.text = [NSString stringWithFormat:@"时长：%@", _data.runtime];
    runtimeLabel.textColor = [UIColor blackColor];
    [self addSubview:runtimeLabel];
    
    //上映时间
    NSString *releaseStr = _data.release_date;
    if (releaseStr.length >= 10) {
        
        releaseStr = [releaseStr substringToIndex:10];
    }
    
    //    UILabel *releaseLabel = [[UILabel alloc] initWithFrame:CGRectMake(kExplianX, 10 + heightCh + heightEn + kChineseTitleFont, kExplainWidth, kChineseTitleFont)];
    UILabel *releaseLabel = [[UILabel alloc] init];
    releaseLabel.text = [NSString stringWithFormat:@"上映时间：%@", releaseStr];
    releaseLabel.textColor = [UIColor blackColor];
    [self addSubview:releaseLabel];
    
    //类别
    NSString *typeString = _data.type;
    if ([typeString containsString:@" / "]) {
        
        typeString = [typeString stringByReplacingOccurrencesOfString:@" / " withString:@","];
    }
    
    //    UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kExplianX, 10 + heightCh + heightEn + kChineseTitleFont * 2, kExplainWidth, kChineseTitleFont)];
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.text = [NSString stringWithFormat:@"类别：%@", typeString];
    typeLabel.textColor = [UIColor blackColor];
    [self addSubview:typeLabel];
    
    //位置调整
    CGFloat spaceHeight = kPosterHeight - 3 * kChineseTitleFont - heightCh - heightEn;
    CGFloat averageSpace = spaceHeight / 4;
    
    englishTitleLabel.frame = CGRectMake(kExplianX, 10 + heightCh + averageSpace, kExplainWidth, heightEn);
    runtimeLabel.frame = CGRectMake(kExplianX, 10 + heightCh + heightEn + averageSpace * 2, kExplainWidth, kChineseTitleFont);
    releaseLabel.frame = CGRectMake(kExplianX, 10 + heightCh + heightEn + averageSpace * 3 + kChineseTitleFont, kExplainWidth, kChineseTitleFont);
    typeLabel.frame = CGRectMake(kExplianX, 10 + heightCh + heightEn + averageSpace * 4 + kChineseTitleFont * 2, kExplainWidth, kChineseTitleFont);
}

@end
