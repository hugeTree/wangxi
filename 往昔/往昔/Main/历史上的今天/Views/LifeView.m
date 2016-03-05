//
//  LifeView.m
//  往昔
//
//  Created by 干晨威 on 16/2/24.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "LifeView.h"
#import "WeatherView.h"

@interface LifeView () <UIScrollViewDelegate>
{
//    UILabel *life;
    
    WeatherDetailLabel *kongtiao;
    
    WeatherDetailLabel *yundong;
    
    WeatherDetailLabel *ziwaixian;
    
    WeatherDetailLabel *ganmao;
    
    WeatherDetailLabel *xiche;
    
    WeatherDetailLabel *wuran;
    
    WeatherDetailLabel *chuanyi;
    
    CGFloat yOffset;
}

@end

@implementation LifeView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
//        _bkgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 700)];
//        
//        [self addSubview:_bkgView];
        
        [self createSubViews];
        
//        self.backgroundColor = [UIColor redColor];
        
        self.showsVerticalScrollIndicator = NO;
        
        self.delegate = self;
    }
    return self;
}

- (void)setLifeModel:(LifeModel *)lifeModel
{
    if (_lifeModel != lifeModel)
    {
        _lifeModel = lifeModel;
        
//        life.text = @"生活指数";
        
        kongtiao.text = @"空调：";
        _kongtiao1.text = _lifeModel.kongtiao[0];
        _kongtiao2.text = _lifeModel.kongtiao[1];
        
        yundong.text = @"运动：";
        _yundong1.text = _lifeModel.yundong[0];
        _yundong2.text = _lifeModel.yundong[1];
        
        ziwaixian.text = @"紫外线：";
        _ziwaixian1.text = _lifeModel.ziwaixian[0];
        _ziwaixian2.text = _lifeModel.ziwaixian[1];
        
        ganmao.text = @"感冒：";
        _ganmao1.text = _lifeModel.ganmao[0];
        _ganmao2.text = _lifeModel.ganmao[1];
        
        xiche.text = @"洗车：";
        _xiche1.text = _lifeModel.xiche[0];
        _xiche2.text = _lifeModel.xiche[1];
        
        wuran.text = @"污染：";
        _wuran1.text = _lifeModel.wuran[0];
        _wuran2.text = _lifeModel.wuran[1];
        
        chuanyi.text = @"穿衣";
        _chuanyi1.text = _lifeModel.chuanyi[0];
        _chuanyi2.text = _lifeModel.chuanyi[1];
    }
}

- (void)createSubViews
{
    //标题
//    life = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
//    life.textAlignment = NSTextAlignmentCenter;
//    life.textColor = [UIColor whiteColor];
//    life.font = [UIFont systemFontOfSize:25];
//    
//    [self addSubview:life];
    
    //空调
    CGFloat kongtiaoWidth = 80;
    CGFloat kongtiaoHeight = 20;
    CGFloat kongtiaoY = 0;
    CGFloat kongtiaoX = kScreenWidth / 4 - kongtiaoWidth;
    
    kongtiao = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(kongtiaoX, kongtiaoY, kongtiaoWidth, kongtiaoHeight)];
    kongtiao.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:kongtiao];
    
    CGFloat kongtiao1Width = kScreenWidth - CGRectGetMaxX(kongtiao.frame) - 10;
    CGFloat kongtiao1Height = 20;
    CGFloat kongtiao1Y = CGRectGetMinY(kongtiao.frame);
    CGFloat kongtiao1X = CGRectGetMaxX(kongtiao.frame);
    
    _kongtiao1 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(kongtiao1X, kongtiao1Y, kongtiao1Width, kongtiao1Height)];
    _kongtiao1.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_kongtiao1];
    
    CGFloat kongtiao2Width = kScreenWidth - CGRectGetMaxX(kongtiao.frame) - 10;
    CGFloat kongtiao2Height = 60;
    CGFloat kongtiao2Y = CGRectGetMaxY(_kongtiao1.frame);
    CGFloat kongtiao2X = CGRectGetMaxX(kongtiao.frame);
    
    _kongtiao2 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(kongtiao2X, kongtiao2Y, kongtiao2Width, kongtiao2Height)];
    _kongtiao2.textAlignment = NSTextAlignmentLeft;
    _kongtiao2.numberOfLines = 3;
    
    [self addSubview:_kongtiao2];
    
    //运动
    CGFloat yundongWidth = 80;
    CGFloat yundongHeight = 20;
    CGFloat yundongY = CGRectGetMaxY(_kongtiao2.frame) + 10;
    CGFloat yundongX = CGRectGetMinX(kongtiao.frame);
    
    yundong = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(yundongX, yundongY, yundongWidth, yundongHeight)];
    yundong.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:yundong];
    
    CGFloat yundong1Width = kScreenWidth - CGRectGetMaxX(yundong.frame) - 10;
    CGFloat yundong1Height = 20;
    CGFloat yundong1Y = CGRectGetMinY(yundong.frame);
    CGFloat yundong1X = CGRectGetMaxX(yundong.frame);
    
    _yundong1 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(yundong1X, yundong1Y, yundong1Width, yundong1Height)];
    _yundong1.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_yundong1];
    
    CGFloat yundong2Width = kScreenWidth - CGRectGetMaxX(yundong.frame) - 10;
    CGFloat yundong2Height = 60;
    CGFloat yundong2Y = CGRectGetMaxY(_yundong1.frame);
    CGFloat yundong2X = CGRectGetMaxX(yundong.frame);
    
    _yundong2 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(yundong2X, yundong2Y, yundong2Width, yundong2Height)];
    _yundong2.textAlignment = NSTextAlignmentLeft;
    _yundong2.numberOfLines = 3;
    
    [self addSubview:_yundong2];
    
    //紫外线
    CGFloat ziwaixianWidth = 80;
    CGFloat ziwaixianHeight = 20;
    CGFloat ziwaixianY = CGRectGetMaxY(_yundong2.frame) + 10;
    CGFloat ziwaixianX = CGRectGetMinX(yundong.frame);
    
    ziwaixian = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(ziwaixianX, ziwaixianY, ziwaixianWidth, ziwaixianHeight)];
    ziwaixian.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:ziwaixian];
    
    CGFloat ziwaixian1Width = kScreenWidth - CGRectGetMaxX(ziwaixian.frame) - 10;
    CGFloat ziwaixian1Height = 20;
    CGFloat ziwaixian1Y = CGRectGetMinY(ziwaixian.frame);
    CGFloat ziwaixian1X = CGRectGetMaxX(ziwaixian.frame);
    
    _ziwaixian1 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(ziwaixian1X, ziwaixian1Y, ziwaixian1Width, ziwaixian1Height)];
    _ziwaixian1.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_ziwaixian1];
    
    CGFloat ziwaixian2Width = kScreenWidth - CGRectGetMaxX(ziwaixian.frame) - 10;
    CGFloat ziwaixian2Height = 60;
    CGFloat ziwaixian2Y = CGRectGetMaxY(_ziwaixian1.frame);
    CGFloat ziwaixian2X = CGRectGetMaxX(ziwaixian.frame);
    
    _ziwaixian2 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(ziwaixian2X, ziwaixian2Y, ziwaixian2Width, ziwaixian2Height)];
    _ziwaixian2.textAlignment = NSTextAlignmentLeft;
    _ziwaixian2.numberOfLines = 3;
    
    [self addSubview:_ziwaixian2];
    
    //感冒
    CGFloat ganmaoWidth = 80;
    CGFloat ganmaoHeight = 20;
    CGFloat ganmaoY = CGRectGetMaxY(_ziwaixian2.frame) + 10;
    CGFloat ganmaoX = CGRectGetMinX(ziwaixian.frame);
    
    ganmao = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(ganmaoX, ganmaoY, ganmaoWidth, ganmaoHeight)];
    ganmao.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:ganmao];
    
    CGFloat ganmao1Width = kScreenWidth - CGRectGetMaxX(ganmao.frame) - 10;
    CGFloat ganmao1Height = 20;
    CGFloat ganmao1Y = CGRectGetMinY(ganmao.frame);
    CGFloat ganmao1X = CGRectGetMaxX(ganmao.frame);
    
    _ganmao1 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(ganmao1X, ganmao1Y, ganmao1Width, ganmao1Height)];
    _ganmao1.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_ganmao1];
    
    CGFloat ganmao2Width = kScreenWidth - CGRectGetMaxX(ganmao.frame) - 10;
    CGFloat ganmao2Height = 60;
    CGFloat ganmao2Y = CGRectGetMaxY(_ganmao1.frame);
    CGFloat ganmao2X = CGRectGetMaxX(ganmao.frame);
    
    _ganmao2 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(ganmao2X, ganmao2Y, ganmao2Width, ganmao2Height)];
    _ganmao2.textAlignment = NSTextAlignmentLeft;
    _ganmao2.numberOfLines = 3;
    
    [self addSubview:_ganmao2];
    
    //洗车
    CGFloat xicheWidth = 80;
    CGFloat xicheHeight = 20;
    CGFloat xicheY = CGRectGetMaxY(_ganmao2.frame) + 10;
    CGFloat xicheX = CGRectGetMinX(ganmao.frame);
    
    xiche = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(xicheX, xicheY, xicheWidth, xicheHeight)];
    xiche.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:xiche];
    
    CGFloat xiche1Width = kScreenWidth - CGRectGetMaxX(xiche.frame) - 10;
    CGFloat xiche1Height = 20;
    CGFloat xiche1Y = CGRectGetMinY(xiche.frame);
    CGFloat xiche1X = CGRectGetMaxX(xiche.frame);
    
    _xiche1 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(xiche1X, xiche1Y, xiche1Width, xiche1Height)];
    _xiche1.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_xiche1];
    
    CGFloat xiche2Width = kScreenWidth - CGRectGetMaxX(xiche.frame) - 10;
    CGFloat xiche2Height = 60;
    CGFloat xiche2Y = CGRectGetMaxY(_xiche1.frame);
    CGFloat xiche2X = CGRectGetMaxX(xiche.frame);
    
    _xiche2 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(xiche2X, xiche2Y, xiche2Width, xiche2Height)];
    _xiche2.textAlignment = NSTextAlignmentLeft;
    _xiche2.numberOfLines = 3;
    
    [self addSubview:_xiche2];
    
    //污染
    CGFloat wuranWidth = 80;
    CGFloat wuranHeight = 20;
    CGFloat wuranY = CGRectGetMaxY(_xiche2.frame) + 10;
    CGFloat wuranX = CGRectGetMinX(xiche.frame);
    
    wuran = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(wuranX, wuranY, wuranWidth, wuranHeight)];
    wuran.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:wuran];
    
    CGFloat wuran1Width = kScreenWidth - CGRectGetMaxX(wuran.frame) - 10;
    CGFloat wuran1Height = 20;
    CGFloat wuran1Y = CGRectGetMinY(wuran.frame);
    CGFloat wuran1X = CGRectGetMaxX(wuran.frame);
    
    _wuran1 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(wuran1X, wuran1Y, wuran1Width, wuran1Height)];
    _wuran1.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_wuran1];
    
    CGFloat wuran2Width = kScreenWidth - CGRectGetMaxX(wuran.frame) - 10;
    CGFloat wuran2Height = 60;
    CGFloat wuran2Y = CGRectGetMaxY(_wuran1.frame);
    CGFloat wuran2X = CGRectGetMaxX(wuran.frame);
    
    _wuran2 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(wuran2X, wuran2Y, wuran2Width, wuran2Height)];
    _wuran2.textAlignment = NSTextAlignmentLeft;
    _wuran2.numberOfLines = 3;
    
    [self addSubview:_wuran2];
    
    //穿衣
    CGFloat chuanyiWidth = 80;
    CGFloat chuanyiHeight = 20;
    CGFloat chuanyiY = CGRectGetMaxY(_wuran2.frame) + 10;
    CGFloat chuanyiX = CGRectGetMinX(chuanyi.frame);
    
    chuanyi = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(chuanyiX, chuanyiY, chuanyiWidth, chuanyiHeight)];
    chuanyi.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:chuanyi];
    
    CGFloat chuanyi1Width = kScreenWidth - CGRectGetMaxX(chuanyi.frame) - 10;
    CGFloat chuanyi1Height = 20;
    CGFloat chuanyi1Y = CGRectGetMinY(chuanyi.frame);
    CGFloat chuanyi1X = CGRectGetMaxX(chuanyi.frame);
    
    _chuanyi1 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(chuanyi1X, chuanyi1Y, chuanyi1Width, chuanyi1Height)];
    _chuanyi1.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_chuanyi1];
    
    CGFloat chuanyi2Width = kScreenWidth - CGRectGetMaxX(chuanyi.frame) - 10;
    CGFloat chuanyi2Height = 60;
    CGFloat chuanyi2Y = CGRectGetMaxY(_chuanyi1.frame);
    CGFloat chuanyi2X = CGRectGetMaxX(chuanyi.frame);
    
    _chuanyi2 = [[WeatherDetailLabel alloc] initWithFrame:CGRectMake(chuanyi2X, chuanyi2Y, chuanyi2Width, chuanyi2Height)];
    _chuanyi2.textAlignment = NSTextAlignmentLeft;
    _chuanyi2.numberOfLines = 3;
    
    [self addSubview:_chuanyi2];
    
    self.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(_chuanyi2.frame) + 10);
}

- (WeatherView *)weatherView
{
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[WeatherView class]]) {
            
            return (WeatherView *)next;
        }
        
        next = next.nextResponder;
    }
    
    return nil;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
//    NSLog(@"返回的view:%@",[self hitTest:point withEvent:event]);
    
//    [self resignFirstResponder];
    
//    [self.weatherView becomeFirstResponder];
    
//    NSLog(@"%@",self.weatherView);
    
    self.scrollEnabled = NO;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.weatherView];
    
    NSLog(@"Y = %lf",point.y);
    
    
    
    if (point.y > 0 && point.y < 400)
    {
        self.scrollEnabled = YES;
    }
    
}


#pragma - mark UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
//    NSLog(@"lifeview响应滑动");
    
    yOffset = scrollView.contentOffset.y;
    
//    NSLog(@"lifeView yOffset = %lf",yOffset);
    
//    if (yOffset < 0)
//    {
//        self.scrollEnabled = NO;
//        [self.weatherView becomeFirstResponder];
//    }else if (yOffset >= 230)
//    {
//        [self.weatherView resignFirstResponder];
//        self.scrollEnabled = NO;
//    }else
//    {
//        [self.weatherView resignFirstResponder];
//        self.scrollEnabled = YES;
//    }
}

@end
