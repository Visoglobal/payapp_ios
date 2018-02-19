//
//  AddCardViewController.h
//  PayApp
//
//  Created by Alexey on 01.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoView.h"
#import "BaseUserViewController.h"
#import "CustomTextField.h"
#import "CardIOPaymentViewControllerDelegate.h"
#import "CardIO.h"
#import "AutoDataScroll.h"
#import "CustomCheckBox.h"
#import "CustomMonthYearPickerView.h"
#import "CustomDropDownControl.h"

@interface AddCardViewController : BaseUserViewController <CardIOPaymentViewControllerDelegate,UITextFieldDelegate,CustomDatePickerViewDelegate, CustomDropDownControlDelegate>
{
    
    CustomTextField *cardNameTextField;
    CustomTextField *cardholderTextField;
    CustomTextField *cardCVC2TextField;
    CustomCheckBox  *cardIsDefaulcheckBox;
    CustomMonthYearPickerView* expireDate;
    CustomDropDownControl* cardSustemDropDown;
    CustomDropDownControl* cardStateDropDown;
    CustomTextField *cardPanTextField;
    
    CGPoint svos;
     UIButton *scanButton;
    __weak IBOutlet UIButton *addButton;
    
}

@property (weak, nonatomic) IBOutlet AutoDataScroll* mainScrollView;

@end
