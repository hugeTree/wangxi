//
//  StarView.h
//  BJWxhl
//
//  Created by zhangchuning on 15/12/9.
//  Copyright © 2015年 oahgnehzoul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    UIImage *_yellowImg;
    UIImage *_grayImg;
}
@property (nonatomic, assign) CGFloat rating; //评分

@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *grayView;


@end
