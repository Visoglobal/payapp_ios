//
//  AuthorizationViewController.h
//  PayApp
//
//  Created by Alexey on 06.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "RoundImageView.h"
#import "AutoDataScroll.h"
#import "CustomTextField.h"

@interface AuthorizationViewController : BaseViewController<UITextFieldDelegate>
{
    AutoDataScroll* loginView;
    AutoDataScroll* accessView;
    AutoDataScroll* confirmView;
    __weak IBOutlet UIImageView *topImageView;
    __weak IBOutlet UIImageView *bottomImageView;
    CustomTextField*      contact;
    CustomTextField*      password;
    CustomTextField*      access;
    CustomTextField*      confirmCode;
    __weak IBOutlet UIButton *enterButton;
    __block UIView* currentVisibleView;
    __weak IBOutlet UILabel *userNameLabel;
}

@property (weak, nonatomic) IBOutlet RoundImageView *userImageView;

@end
