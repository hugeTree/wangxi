//
//  ImgFaceView.h
//  84班微博
//
//  Created by 干晨威 on 16/1/25.
//  Copyright © 2016年 george. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgFaceView : UIView
{
    NSMutableArray *faceItemArr;  //数组中每一个元素为一个数组，存放一个页面的表情
    
    UIImageView *magnifierView;  //放大镜视图
    
    NSInteger lastTouchIndex;
}

@property (nonatomic, assign) NSInteger pageCount;

//传值kvo监听对象
@property(nonatomic, copy)NSString *faceName_kvo;

@end
