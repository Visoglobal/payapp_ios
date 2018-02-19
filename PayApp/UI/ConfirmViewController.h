//
//  ConfirmViewController.h
//  PayApp
//
//  Created by Alexey on 12.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "RoundImageView.h"
#import "AutoDataScroll.h"
#import "CustomTextField.h"

@interface ConfirmViewController : BaseViewController<UITextFieldDelegate>
{
    AutoDataScroll*  confirmView;
    CustomTextField* confirmCode;
    
    __weak IBOutlet UIImageView *topImageView;
    __weak IBOutlet UIImageView *bottomImageView;
    __weak IBOutlet UIButton *enterButton;
    __weak IBOutlet UILabel *userNameLabel;
    
}

@property (weak, nonatomic) IBOutlet RoundImageView *userImageView;

@end