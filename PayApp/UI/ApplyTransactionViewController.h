//
//  ApplyTransactionViewController.h
//  PayApp
//
//  Created by Alexey on 04.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BaseUserViewController.h"
#import "UserInfoView.h"
#import "TransactionView.h"
#import "Card.h"

@interface ApplyTransactionViewController : BaseUserViewController
{
    __weak IBOutlet UIButton *applyButton;
    __weak IBOutlet UILabel *transactionTitle;
    __weak IBOutlet UILabel *transactionValue;
    __weak IBOutlet UILabel *comissionTitle;
    __weak IBOutlet UILabel *comissionValue;
    __weak IBOutlet TransactionView *transactionView;
    Card* selectedCard;
}

@property (weak, nonatomic) UserInfoView *userInfoView;

@end
