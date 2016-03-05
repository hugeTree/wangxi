//
//  StarView.m
//  BJWxhl
//
//  Created by zhangchuning on 15/12/9.
//  Copyright © 2015年 oahgnehzoul. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"

@interface StarView()

@end

@implementation StarView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)awakeFromNib {

    self.backgroundColor = [UIColor clearColor];
}

- (void)setRating:(CGFloat)rating {
    
    if (rating) {
//        _yellowImg = [[UIImage alloc] init];
//        _grayImg = [[UIImage alloc] init];
        _yellowImg = [UIImage imageNamed:@"yellow"];
        _grayImg = [UIImage imageNamed:@"gray"];
        
        _rating = rating;
        
        self.grayView.backgroundColor = [UIColor colorWithPatternImage:_grayImg];
        self.yellowView.backgroundColor = [UIColor colorWithPatternImage:_yellowImg];
        
        [self setSubViewsFrame];
        //设置星星父视图的宽度为高度的5倍
        CGFloat star5Width = self.frame.size.height * 5;
        
        self.width = star5Width;
        //放大灰色星星视图和黄色星星视图，放大倍数为view的高度/星星图片高度
        CGFloat scale = self.frame.size.height / _yellowImg.size.height;
        CGAffineTransform t = CGAffineTransformMakeScale(scale, scale);
        
        _grayView.transform = t;
        _yellowView.transform = t;
        //重新修改起始点。
        _grayView.origin = CGPointZero;
        _yellowView.origin = CGPointZero;
        
        
        CGFloat s = rating / 10.0;
        //黄色星星宽度设置
        CGFloat width = self.frame.size.height / _yellowImg.size.height * _yellowImg.size.width * 5 * s;
        //修改黄色星星视图宽度
        _yellowView.width = width;
        
    }else {
        
        rating = 7.4;
        [self setRating:rating];
    }
    
}

- (void)setSubViewsFrame {
    
    _grayView.frame = CGRectMake(0, 0, _grayImg.size.width * 5, _grayImg.size.height);
    _yellowView.frame = CGRectMake(0, 0, _yellowImg.size.width * 5, _yellowImg.size.height);
}

#pragma -mark -懒加载
@synthesize yellowView = _yellowView;
@synthesize grayView = _grayView;

- (UIView *)yellowView {
    
    if (!_yellowView) {
        
        _yellowView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self addSubview:_yellowView];
    }
    
    return _yellowView;
}

- (UIView *)grayView {
    
    if (!_grayView) {
        
        _grayView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self addSubview:_grayView];
    }
    
    return _grayView;
}

@end
