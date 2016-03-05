//
//  RegisteredViewController.h
//  往昔
//
//  Created by Macx on 16/2/20.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "BaseViewController.h"

@interface RegisteredViewController : BaseViewController<UITextFieldDelegate,UIAlertViewDelegate>

{
    __weak IBOutlet UIImageView *imageView;

    __weak IBOutlet UITextField *newName;

    __weak IBOutlet UITextField *newPassword;
}
- (IBAction)registered:(id)sender;

@end
