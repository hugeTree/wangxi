//
//  TodayCell.m
//  往昔
//
//  Created by 干晨威 on 16/2/6.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "TodayCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Resize.h"

@implementation TodayCell

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setCellLayout:(TodayCellLayout *)cellLayout
{
    if (_cellLayout != cellLayout)
    {
        _cellLayout = cellLayout;
        
        self.titleLabel.text = _cellLayout.todayModel.title;
        self.subTitleLabel.text = _cellLayout.todayModel.des;
        self.yearLabel.text = [NSString stringWithFormat:@"%ld",_cellLayout.todayModel.year];
        self.eventId = _cellLayout.todayModel._id;
        
        //有图片url地址时，加载图片
        if (_cellLayout.todayModel.pic.length > 0)
        {
            [self.bkgImgView sd_setImageWithURL:[NSURL URLWithString:_cellLayout.todayModel.pic] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
                
                //将加载好的image大小调整为宽度同cell视图一样宽，高度按比率改变
                CGFloat newSizeWidth = kScreenWidth - kSpaceSize;
                CGFloat newSizeHeight = image.size.height * (newSizeWidth / image.size.width);
                
                UIImage *newSizeImage = [image resizedImage:CGSizeMake(newSizeWidth, newSizeHeight) interpolationQuality:kCGInterpolationHigh];
                
                //将缩放后的image根据一个rect作裁切
                UIImage *croppedImage = [newSizeImage croppedImage:CGRectMake(0, 60, newSizeWidth, 200)];
                
                self.bkgImgView.image = croppedImage;
                
            }];
        }
        
        
        _bkgImgView.backgroundColor = [UIColor whiteColor];
    }
    
    //根据事先计算好的值给cell的子视图的frame赋值
    [self setCellSubViewFrame];

}

//给cell的子视图的frame复制
- (void)setCellSubViewFrame
{
    self.bkgImgView.frame = _cellLayout.imgFrame;
    self.titleLabel.frame = _cellLayout.titleFrame;
    self.subTitleLabel.frame = _cellLayout.subTitleFrame;
    self.bkgView.frame = _cellLayout.bkgViewFrame;
//    self.yearLabel.frame = _cellLayout.yealLabelFrame;
    
}

//裁剪背景视图（不知道为什么，总是提示contex为invalid）
//- (void)cutBkgImg:(UIImage *)image
//{
//    UIImage *scaledImage = [self scaleImage:image toScale:(kScreenWidth - kSpaceSize) / image.size.width];
//    
//    CGRect clipRect = CGRectMake(0, 40, scaledImage.size.width, _cellLayout.bkgImgViewWindowFrame.size.height);
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:clipRect];
//    
//    [path addClip];
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    NSLog(@"%@",context);
//    
//    [self.bkgImgView.layer renderInContext:context];
//    
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    self.bkgImgView.image = img;
//}

//缩放uiimage
//- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
//{
//    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
//    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
//    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return scaledImage;
//    
//}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma - mark 懒加载
@synthesize titleLabel = _titleLabel;

@synthesize subTitleLabel = _subTitleLabel;

@synthesize bkgImgView = _bkgImgView;

@synthesize bkgView = _bkgView;

//@synthesize yearLabel = _yearLabel;

- (WXLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _titleLabel.wxLabelDelegate = self;
        _titleLabel.linespace = kTitleLineSpace;
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:kTitleSize weight:0.3];
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (WXLabel *)subTitleLabel
{
    if (!_subTitleLabel)
    {
        _subTitleLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
        _subTitleLabel.wxLabelDelegate = self;
        _subTitleLabel.linespace = kSubTitleLineSpace;
        _subTitleLabel.numberOfLines = 0;
        _subTitleLabel.font = [UIFont systemFontOfSize:kSubTitleSize];
        [self.contentView addSubview:_subTitleLabel];
    }
    
    return _subTitleLabel;
}

- (UIImageView *)bkgImgView
{
    if (!_bkgImgView)
    {
        _bkgImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_bkgImgView];
    }
    
    return _bkgImgView;
}

- (UIView *)bkgView
{
    if (!_bkgView)
    {
        _bkgView = [[UIView alloc] initWithFrame:CGRectZero];
        _bkgView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView insertSubview:_bkgView belowSubview:_titleLabel];
    }
    
    return _bkgView;
}

//- (WXLabel *)yearLabel
//{
//    if (!_yearLabel)
//    {
//        _yearLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
//        _yearLabel.wxLabelDelegate = self;
//        _yearLabel.font = [UIFont systemFontOfSize:kYearLabelSize weight:0.5];
//        _yearLabel.textColor = [UIColor whiteColor];
//        _yearLabel.shadowColor = [UIColor colorWithWhite:0 alpha:0.5];
//        _yearLabel.shadowOffset = CGSizeMake(1, 1);
//        
//        [self.contentView addSubview:_yearLabel];
//    }
//    
//    return _yearLabel;
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

@end
