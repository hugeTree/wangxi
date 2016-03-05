//
//  MoreViewController.h
//  往昔
//
//  Created by 林亮亮 on 16-2-1.
//  Copyright (c) 2015年 林亮亮. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
@interface MoreViewController : UITableViewController<UIAlertViewDelegate>

{

    __weak IBOutlet UILabel *_countLabel;
}

- (IBAction)logOut:(id)sender;


//- (void)showMain;
@end
