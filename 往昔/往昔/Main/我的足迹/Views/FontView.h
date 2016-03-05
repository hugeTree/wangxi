//
//  FontView.h
//  往昔
//
//  Created by Macx on 16/2/25.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef 返回值名称 (^blockName)(参数列表)
typedef void (^ColorBlock)(UIColor *color);
typedef void (^LineWidthBlock)(CGFloat lineWidth);
@interface FontView : UIView
{

    
    //UIView *_colorView;
    
    ColorBlock _colorBlock;
    LineWidthBlock _lineWidthBlock;

}
- (void) colorBlock:(ColorBlock)colorBlock;

- (void) lineWidthBlock:(LineWidthBlock)lineWidthBlock;
@end
