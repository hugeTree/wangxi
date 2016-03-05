//
//  LogInViewController.h
//  往昔
//
//  Created by Macx on 16/2/20.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "BaseViewController.h"

@interface LogInViewController : BaseViewController<UITextFieldDelegate>
{

    __weak IBOutlet UIImageView *imageView;

    __weak IBOutlet UITextField *nameText;

    __weak IBOutlet UITextField *passwordText;
}
@end
