//
//  RestoreSessionViewController.h
//  PayApp
//
//  Created by Alexey on 29.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUserViewController.h"
#import "CustomTextField.h"
#import "MainButton.h"

@interface RestoreSessionViewController : BaseUserViewController <UITextFieldDelegate>
{
    
    CustomTextField *passwordTextField;
    UILabel* errorMessageLabel;
    IBOutlet MainButton* connectButton;
    IBOutlet UIButton* exitButton;
}

@end
