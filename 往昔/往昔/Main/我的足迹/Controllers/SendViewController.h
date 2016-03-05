//
//  SendViewController.h
//  往昔
//
//  Created by Macx on 16/2/22.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "BaseViewController.h"

@class MineViewController;
@interface SendViewController : BaseViewController<UITextViewDelegate,UIAlertViewDelegate>
{
    NSMutableDictionary *userData;
    NSMutableArray *diary;
    NSString *newString;
    NSString *fileName;
    NSMutableArray *date;
    NSMutableArray *fontColor;
    NSString *colorString;
    NSMutableArray *Textcolor;
    NSString *textString;
    
}
@property (nonatomic,strong) UITextView *textView;

@property (nonatomic, strong)NSArray *data;

@property (nonatomic, strong)NSIndexPath *indexPath;

@property (nonatomic, strong)NSArray *wideData;
@end
