//
//  FontView.m
//  往昔
//
//  Created by Macx on 16/2/25.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "FontView.h"

@implementation FontView

- (void)drawRect:(CGRect)rect
{
    UIImage *img = [UIImage imageNamed:@"emoticon_keyboard_background"];
    [img drawInRect:rect];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatView];

    }
    return self;
}

- (void)creatView{
    
//    FontColorView *fontColorView = [[FontColorView alloc]initWithFrame:CGRectZero];

//    _colorView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 226, kScreenWidth, 226)];
//    
//    [self addSubview:_colorView];
    
//    [_colorView addSubview:fontColorView];
//    
//    self.fontColorView = fontColorView;
    
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake((kScreenWidth - 200 )/ 2, 50, 200, 20)];

    slider.minimumValue = 15;
    slider.maximumValue = 25;
    
    [slider addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:slider];
    
    NSArray *colorArr = @[[UIColor redColor],[UIColor blackColor],[UIColor grayColor],[UIColor blueColor],[UIColor yellowColor],[UIColor orangeColor],[UIColor purpleColor],[UIColor greenColor],[UIColor whiteColor ],[UIColor magentaColor]];
    
    for (int i = 0; i < 5; i++) {
        
        for (int j = 0; j < 2; j++) {
            
            UIButton *colorButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            colorButton.frame = CGRectMake(i * (kScreenWidth / 5 + 3)+ 5, 126 + j * 50, kScreenWidth / 5 - 25, 30);
            
            colorButton.backgroundColor = colorArr[i + j * 5];;
            
            [colorButton addTarget:self action:@selector(colorButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:colorButton];
        }
        
    }
    
    
    
        

}

#pragma mark - block实现,调用

- (void) colorBlock:(ColorBlock)colorBlock
{
    _colorBlock = colorBlock;
    
}

- (void) lineWidthBlock:(LineWidthBlock)lineWidthBlock
{
    _lineWidthBlock = lineWidthBlock;
    
}

//线宽按钮

- (void)change:(UISlider *)slider
{

    //NSNumber *number =
    CGFloat lineWidth = slider.value;;

    if (_lineWidthBlock != nil) {

        _lineWidthBlock(lineWidth);

    }

}

//颜色按钮
- (void)colorButtonAction:(UIButton *)button
{
    UIColor *color = button.backgroundColor;
    if (_colorBlock != nil) {
        _colorBlock(color);
    }
    
}

@end
