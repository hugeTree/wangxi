//
//  OldCalenderView.m
//  往昔
//
//  Created by 干晨威 on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "OldCalenderView.h"

#define kTextSpace 30
#define kTextSize 38
#define kRowSpace 5

@interface OldCalenderView ()
{
    UIImageView *bkgImgView;
}

@end

@implementation OldCalenderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
//        UIImage *bkgImage = [UIImage imageNamed:@"bagua.png"];
        
        bkgImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        bkgImgView.image = [UIImage imageNamed:@"bagua.jpeg"];
        
        [self addSubview:bkgImgView];
        
        self.scrollEnabled = YES;
        
//        [self createLabels];
        
//        NSArray *familyNames = [UIFont familyNames];
//        for( NSString *familyName in familyNames )
//        {
//            printf( "Family: %s \n", [familyName UTF8String]);
//            
//            NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
//            for( NSString *fontName in fontNames )
//            {
//                printf( "\tFont: %s \n", [fontName UTF8String] );
//            }
//        }
    }
    return self;
}

- (void)setOldCalenderModel:(OldCalenderModel *)oldCalenderModel
{
    if (_oldCalenderModel != oldCalenderModel)
    {
        _oldCalenderModel = oldCalenderModel;
        
//        NSLog(@"%@",oldCalenderModel);
        
        
        self.yangliLabel.text = [NSString stringWithFormat:@"阳历：%@", oldCalenderModel.yangli];
        self.yinliLabel.text = [NSString stringWithFormat:@"阴历：%@", oldCalenderModel.yinli];
        self.wuxingLabel.text = [NSString stringWithFormat:@"五行：%@", oldCalenderModel.wuxing];
        self.chongshaLabel.text = [NSString stringWithFormat:@"冲煞：%@", oldCalenderModel.chongsha];
        self.baijiLabel.text = [NSString stringWithFormat:@"彭祖百忌：%@", oldCalenderModel.baiji];
        self.jishenLabel.text = [NSString stringWithFormat:@"吉神宜趋：%@", oldCalenderModel.jishen];
        self.yiLabel.text = [NSString stringWithFormat:@"宜：%@", oldCalenderModel.yi];
        self.xiongshenLabel.text = [NSString stringWithFormat:@"凶神宜忌：%@", oldCalenderModel.xiongshen];
        self.jiLabel.text = [NSString stringWithFormat:@"忌：%@", oldCalenderModel.ji];
    }
    
//    NSLog(@"%@",_yangliLabel);
    
//    NSLog(@"%@",_yangliLabel.text);
    
    [self layoutFrames];
    
}

- (void)layoutFrames
{
    CGFloat textWidth = kScreenWidth - kTextSpace * 2;
    
    CGFloat yangliHeight = [WXLabel getTextHeight:kTextSize width:textWidth text:_yangliLabel.text linespace:5];
    CGFloat yinliHeight = [WXLabel getTextHeight:kTextSize width:textWidth text:_yinliLabel.text linespace:5];
    CGFloat wuxingHeight = [WXLabel getTextHeight:kTextSize width:textWidth text:_wuxingLabel.text linespace:5];
    CGFloat chongshaHeight = [WXLabel getTextHeight:kTextSize width:textWidth text:_chongshaLabel.text linespace:5];
    CGFloat baijiHeight = [WXLabel getTextHeight:kTextSize width:textWidth text:_baijiLabel.text linespace:5];
    CGFloat jishenHeight = [WXLabel getTextHeight:kTextSize width:textWidth text:_jishenLabel.text linespace:5];
    CGFloat yiHeight = [WXLabel getTextHeight:kTextSize width:textWidth text:_yiLabel.text linespace:5];
    CGFloat xiongshenHeight = [WXLabel getTextHeight:kTextSize width:textWidth text:_xiongshenLabel.text linespace:5];
    CGFloat jiHeight = [WXLabel getTextHeight:kTextSize width:textWidth text:_jiLabel.text linespace:5];
    
    CGRect yangliFrame = CGRectMake(kTextSpace, kTextSpace, textWidth, yangliHeight);
    _yangliLabel.frame = yangliFrame;
    
    CGFloat yinliY = CGRectGetMaxY(_yangliLabel.frame) + kRowSpace;
    CGRect yinliFrame = CGRectMake(kTextSpace, yinliY, textWidth, yinliHeight);
    _yinliLabel.frame = yinliFrame;
    
    CGFloat wuxingY = CGRectGetMaxY(_yinliLabel.frame) + kRowSpace;
    CGRect wuxingFrame = CGRectMake(kTextSpace, wuxingY, textWidth, wuxingHeight);
    _wuxingLabel.frame = wuxingFrame;
    
    CGFloat chongshaY = CGRectGetMaxY(_wuxingLabel.frame) + kRowSpace;
    CGRect chongshaFrame = CGRectMake(kTextSpace, chongshaY, textWidth, chongshaHeight);
    _chongshaLabel.frame = chongshaFrame;
    
    CGFloat baijiY = CGRectGetMaxY(_chongshaLabel.frame) + kRowSpace;
    CGRect baijiFrame = CGRectMake(kTextSpace, baijiY, textWidth, baijiHeight);
    _baijiLabel.frame = baijiFrame;
    
    CGFloat jishenY = CGRectGetMaxY(_baijiLabel.frame) + kRowSpace;
    CGRect jishenFrame = CGRectMake(kTextSpace, jishenY, textWidth, jishenHeight);
    _jishenLabel.frame = jishenFrame;
    
    CGFloat yiY = CGRectGetMaxY(_jishenLabel.frame) + kRowSpace;
    CGRect yiFrame = CGRectMake(kTextSpace, yiY, textWidth, yiHeight);
    _yiLabel.frame = yiFrame;
    
    CGFloat xiongshenY = CGRectGetMaxY(_yiLabel.frame) + kRowSpace;
    CGRect xiongshenFrame = CGRectMake(kTextSpace, xiongshenY, textWidth, xiongshenHeight);
    _xiongshenLabel.frame = xiongshenFrame;
    
    CGFloat jiY = CGRectGetMaxY(_xiongshenLabel.frame) + kRowSpace;
    CGRect jiFrame = CGRectMake(kTextSpace, jiY, textWidth, jiHeight);
    _jiLabel.frame = jiFrame;
    
    self.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(_jiLabel.frame) + 100);
    
    bkgImgView.frame = CGRectMake(-200, -200, kScreenWidth + 400, CGRectGetMaxY(_jiLabel.frame) + 200 + 200 + 100);
    
}


#pragma - mark 懒加载
@synthesize yangliLabel = _yangliLabel;
@synthesize yinliLabel = _yinliLabel;
@synthesize wuxingLabel = _wuxingLabel;
@synthesize chongshaLabel = _chongshaLabel;
@synthesize baijiLabel = _baijiLabel;
@synthesize jishenLabel = _jishenLabel;
@synthesize yiLabel = _yiLabel;
@synthesize xiongshenLabel = _xiongshenLabel;
@synthesize jiLabel = _jiLabel;

- (UILabel *)yangliLabel
{
    if (_yangliLabel == nil)
    {
        _yangliLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _yangliLabel.font = [UIFont fontWithName:@"STXingkai-SC-Bold" size:kTextSize];
//        _yangliLabel.font = [UIFont systemFontOfSize:kTextSize weight:0.4];
        _yangliLabel.font = [_yangliLabel.font fontWithSize:30];
        _yangliLabel.numberOfLines = 0;
        _yangliLabel.linespace = 2;
        _yangliLabel.wxLabelDelegate = self;
        
        [self addSubview:_yangliLabel];
    }
    return _yangliLabel;
}

- (WXLabel *)yinliLabel
{
    if (_yinliLabel == nil)
    {
        _yinliLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _yinliLabel.font = [UIFont fontWithName:@"STXingkai-SC-Bold" size:kTextSize];
//        _yinliLabel.font = [UIFont systemFontOfSize:kTextSize weight:0.4];
        _yinliLabel.font = [_yinliLabel.font fontWithSize:30];
        _yinliLabel.numberOfLines = 0;
        _yinliLabel.linespace = 2;
        _yinliLabel.wxLabelDelegate = self;
        
        [self addSubview:_yinliLabel];
    }
    return _yinliLabel;
}

- (WXLabel *)wuxingLabel
{
    if (_wuxingLabel == nil)
    {
        _wuxingLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _wuxingLabel.font = [UIFont fontWithName:@"STXingkai-SC-Bold" size:kTextSize];
//        _wuxingLabel.font = [UIFont systemFontOfSize:kTextSize weight:0.4];
        _wuxingLabel.font = [_wuxingLabel.font fontWithSize:30];
        _wuxingLabel.numberOfLines = 0;
        _wuxingLabel.linespace = 2;
        _wuxingLabel.wxLabelDelegate = self;
        
        [self addSubview:_wuxingLabel];
    }
    return _wuxingLabel;
}

- (WXLabel *)chongshaLabel
{
    if (_chongshaLabel == nil)
    {
        _chongshaLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _chongshaLabel.font = [UIFont fontWithName:@"STXingkai-SC-Bold" size:kTextSize];
//        _chongshaLabel.font = [UIFont systemFontOfSize:kTextSize weight:0.4];
        _chongshaLabel.font = [_chongshaLabel.font fontWithSize:30];
        _chongshaLabel.numberOfLines = 0;
        _chongshaLabel.linespace = 2;
        _chongshaLabel.wxLabelDelegate = self;
        
        [self addSubview:_chongshaLabel];
    }
    return _chongshaLabel;
}

- (WXLabel *)baijiLabel
{
    if (_baijiLabel == nil)
    {
        _baijiLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _baijiLabel.font = [UIFont fontWithName:@"STXingkai-SC-Bold" size:kTextSize];
//        _baijiLabel.font = [UIFont systemFontOfSize:kTextSize weight:0.4];
        _baijiLabel.font = [_baijiLabel.font fontWithSize:30];
        _baijiLabel.numberOfLines = 0;
        _baijiLabel.linespace = 2;
        _baijiLabel.wxLabelDelegate = self;
        
        [self addSubview:_baijiLabel];
    }
    return _baijiLabel;
}

- (WXLabel *)jishenLabel
{
    if (_jishenLabel == nil)
    {
        _jishenLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _jishenLabel.font = [UIFont fontWithName:@"STXingkai-SC-Bold" size:kTextSize];
//        _jishenLabel.font = [UIFont systemFontOfSize:kTextSize weight:0.4];
        _jishenLabel.font = [_jishenLabel.font fontWithSize:30];
        _jishenLabel.numberOfLines = 0;
        _jishenLabel.linespace = 2;
        _jishenLabel.wxLabelDelegate = self;
        
        [self addSubview:_jishenLabel];
    }
    return _jishenLabel;
}

- (WXLabel *)yiLabel
{
    if (_yiLabel == nil)
    {
        _yiLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _yiLabel.font = [UIFont fontWithName:@"STXingkai-SC-Bold" size:kTextSize];
//        _yiLabel.font = [UIFont systemFontOfSize:kTextSize weight:0.4];
        _yiLabel.font = [_yiLabel.font fontWithSize:30];
        _yiLabel.numberOfLines = 0;
        _yiLabel.linespace = 2;
        _yiLabel.wxLabelDelegate = self;
        
        [self addSubview:_yiLabel];
    }
    return _yiLabel;
}

- (WXLabel *)xiongshenLabel
{
    if (_xiongshenLabel == nil)
    {
        _xiongshenLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _xiongshenLabel.font = [UIFont fontWithName:@"STXingkai-SC-Bold" size:kTextSize];
//        _xiongshenLabel.font = [UIFont systemFontOfSize:kTextSize weight:0.4];
        _xiongshenLabel.font = [_xiongshenLabel.font fontWithSize:30];
        _xiongshenLabel.numberOfLines = 0;
        _xiongshenLabel.linespace = 2;
        _xiongshenLabel.wxLabelDelegate = self;
        
        [self addSubview:_xiongshenLabel];
    }
    return _xiongshenLabel;
}

- (WXLabel *)jiLabel
{
    if (_jiLabel == nil)
    {
        _jiLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _jiLabel.font = [UIFont fontWithName:@"STXingkai-SC-Bold" size:kTextSize];
//        _jiLabel.font = [UIFont systemFontOfSize:kTextSize weight:0.4];
        _jiLabel.font = [_jiLabel.font fontWithSize:30];
        _jiLabel.numberOfLines = 0;
        _jiLabel.linespace = 2;
        _jiLabel.wxLabelDelegate = self;
        
        [self addSubview:_jiLabel];
    }
    return _jiLabel;
}

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

@end
