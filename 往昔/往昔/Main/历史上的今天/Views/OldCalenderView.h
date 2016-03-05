//
//  OldCalenderView.h
//  往昔
//
//  Created by 干晨威 on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OldCalenderModel.h"
#import "WXLabel.h"

@interface OldCalenderView : UIScrollView <WXLabelDelegate>

@property (nonatomic, strong) OldCalenderModel *oldCalenderModel;

@property (nonatomic, strong) WXLabel *yangliLabel;  //阳历
@property (nonatomic, strong) WXLabel *yinliLabel;  //阴历
@property (nonatomic, strong) WXLabel *wuxingLabel;  //五行
@property (nonatomic, strong) WXLabel *chongshaLabel;  //冲煞
@property (nonatomic, strong) WXLabel *baijiLabel;  //彭祖百忌
@property (nonatomic, strong) WXLabel *jishenLabel;  //吉神宜趋
@property (nonatomic, strong) WXLabel *yiLabel;  //宜
@property (nonatomic, strong) WXLabel *xiongshenLabel;  //凶神宜忌
@property (nonatomic, strong) WXLabel *jiLabel;  //忌


@end
