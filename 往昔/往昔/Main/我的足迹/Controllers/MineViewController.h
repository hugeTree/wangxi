//
//  MineViewController.h
//  往昔
//
//  Created by Macx on 16/2/21.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "BaseViewController.h"
#import "WXLabel.h"

@interface MineViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,WXLabelDelegate>
{
    NSMutableDictionary *userData;
    NSMutableArray *diary;
    NSString *fileName;
    NSMutableArray *date;
    NSMutableArray *fontColor;
    NSMutableArray *Textcolor;
    
}
@property(nonatomic, strong)WXLabel *dirayLabel;
@property(nonatomic, strong, readonly)WXLabel *timeLabel;
@end
