//
//  TodayDetailView.m
//  往昔
//
//  Created by 干晨威 on 16/2/12.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "TodayDetailView.h"
#import "WXLabel.h"
#import "UIImage+Resize.h"
#import "UIImageView+WebCache.h"
#import "TodayDetailViewController.h"
#import "BaseNavigationController.h"

#define kSpaceSize 15

@interface TodayDetailView () <WXLabelDelegate>
{
    WXLabel *title;
    
    WXLabel *content;
    
    UIImageView *imgView;
}

@end

@implementation TodayDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    
    return self;
}

- (void)setEventId:(NSString *)eventId
{
    if (_eventId != eventId)
    {
        _eventId = eventId;
        
        [self loadData];
    }
}

- (void)loadData
{
    NSString *urlString = @"http://api.juheapi.com/japi/tohdet";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    
    NSDictionary *params = @{
                             @"key" : @"f7a023027fef1ac48a8dc75837facc0a",
                             @"v" : @"1.0",
                             @"id" : _eventId
                             };
    
    
    [manager POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self layoutDetails:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求失败\n%@",error);
    }];
}

//布局详情页
- (void)layoutDetails:(id)responseObject
{
    NSDictionary *result = responseObject[@"result"];
    
    //更改导航栏的标题为当前时间的年月日
    long year = [result[@"year"] integerValue];
    long month = [result[@"month"] integerValue];
    long day = [result[@"day"] integerValue];
    
    NSString *titleStr = [NSString stringWithFormat:@"%ld年%ld月%ld日",year,month,day];
    
    BaseNavigationController *baseNaviVC = [UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0];
    
    TodayDetailViewController *todayDetailVC = (TodayDetailViewController *)baseNaviVC.topViewController;
    
    todayDetailVC.title = titleStr;
    
    //加载图片
    NSString *picURLStr = result[@"pic"];
    if (picURLStr.length > 0)
    {
        imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [imgView sd_setImageWithURL:[NSURL URLWithString:picURLStr] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            CGFloat width = kScreenWidth - kSpaceSize;
            CGFloat height = image.size.height * (width / image.size.width);
            
            UIImage *resizedImage = [image resizedImage:CGSizeMake(width, height) interpolationQuality:kCGInterpolationHigh];
            
            imgView.image = resizedImage;
            
            imgView.frame = CGRectMake(kSpaceSize / 2, kSpaceSize / 2, width, height);
            
            [self addSubview:imgView];
        }];

    }
    
    //加载文字内容
    title = [[WXLabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont systemFontOfSize:20 weight:0.3];
    title.linespace = 6;
    title.numberOfLines = 0;
    title.wxLabelDelegate = self;
    title.text = result[@"title"];
    title.textAlignment = NSTextAlignmentCenter;
    
    CGFloat titleY = CGRectGetMaxY(imgView.frame) + kSpaceSize / 2;
    CGFloat titleWidth = kScreenWidth - kSpaceSize * 2;
    CGFloat titleHeight = [WXLabel getTextHeight:20 width:titleWidth text:title.text linespace:title.linespace];
    
    title.frame = CGRectMake(kSpaceSize, titleY, titleWidth, titleHeight);
    
    [self addSubview:title];
    
    content = [[WXLabel alloc] initWithFrame:CGRectZero];
    content.font = [UIFont systemFontOfSize:16];
    content.linespace = 4;
    content.numberOfLines = 0;
    content.wxLabelDelegate = self;
    content.text = result[@"content"];
    
    CGFloat contentY = CGRectGetMaxY(title.frame) + kSpaceSize;
    CGFloat contentWidth = kScreenWidth - kSpaceSize * 2;
    CGFloat contentHeight = [WXLabel getTextHeight:16 width:contentWidth text:content.text linespace:content.linespace];
    
    content.frame = CGRectMake(kSpaceSize, contentY, contentWidth, contentHeight);
    
    [self addSubview:content];
    
    self.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(content.frame) + 49);
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
