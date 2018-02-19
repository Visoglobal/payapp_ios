//
//  TransactionFilterViewController.h
//  PayApp
//
//  Created by Alexey on 03.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BaseUserViewController.h"
#import "UserInfoView.h"
#import "CustomDatePickerView.h"
#import "CustomDropDownControl.h"
#import "TransactionFilterData.h"

@interface TransactionFilterViewController : BaseUserViewController<CustomDatePickerViewDelegate,CustomDropDownControlDelegate>
{
    __weak IBOutlet UIButton *applyeButton;
    CustomDatePickerView* transactionDate;
    CustomDropDownControl* typeDtropDown;
    TransactionFilterData* filterData;
    NSArray* cardsArray;
    UIButton *showCardButton;
}

@property (weak, nonatomic) UserInfoView *userInfoView;

@end
