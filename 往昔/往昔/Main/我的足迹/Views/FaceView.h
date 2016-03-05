//
//  FaceView.h
//  84班微博
//
//  Created by 干晨威 on 16/1/25.
//  Copyright © 2016年 george. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgFaceView.h"

@interface FaceView : UIScrollView <UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pgCtrl;
}

@property (nonatomic, weak) ImgFaceView *imgFaceView;

@end
