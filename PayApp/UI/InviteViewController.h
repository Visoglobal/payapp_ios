//
//  InviteViewController.h
//  PayApp
//
//  Created by Alexey on 02.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUserViewController.h"
#import "CustomTextField.h"
#import "UserInfoView.h"

@interface InviteViewController : BaseUserViewController<UITextFieldDelegate>
{
    __weak IBOutlet CustomTextField *contactTextField;
    __weak IBOutlet UIButton *sendInviteButton;
}

@property (weak, nonatomic) UserInfoView *userInfoView;

@end
