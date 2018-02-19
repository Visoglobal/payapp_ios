//
//  RegistrationViewController.h
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "AutoDataScroll.h"
#import "User.h"
#import "CustomTextField.h"
#import "CustomDatePickerView.h"
#import "SexSelectionView.h"

@interface RegistrationViewController : BaseViewController<UITextFieldDelegate, UIScrollViewDelegate,CustomDatePickerViewDelegate>
{
    User* userInfo;
    CustomTextField*      contact;
    CustomTextField*      password;
    CustomTextField*      rePassword;
    CustomTextField*      firstName;
    CustomTextField*      secondName;
    CustomTextField*      parentName;
    
    CustomDatePickerView* birthDate;
    SexSelectionView*     sex;
}


@property (weak, nonatomic) IBOutlet AutoDataScroll* mainScrollView;
@property (weak, nonatomic) IBOutlet UIButton*       registerButton;

@end
