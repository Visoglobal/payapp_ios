//
//  ApplyTransactionViewController.h
//  PayApp
//
//  Created by Alexey on 04.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UserInfoView.h"
#import "TransactionView.h"
#import "RequestButton.h"
#import "RequestApplyButton.h"
#import "Client.h"
#import "Card.h"
#import "VerifyWebView.h"

@interface TransactionViewController : BaseViewController<UITextFieldDelegate, UIWebViewDelegate>
{
    __weak IBOutlet TransactionView *transactionView;
    __weak IBOutlet UILabel *sumLable;
    __weak IBOutlet UITextField *sumTextField;
    __weak IBOutlet RequestApplyButton *applyButton;
    __weak IBOutlet UILabel *comissionLable;
    __weak IBOutlet UILabel *warningLable;
    __weak IBOutlet UILabel *additionalComissionLable;
    __weak IBOutlet UIView *enterSumView;
    __weak IBOutlet UIView *buttonSumView;
    float requestedSumValue;
    NSArray* requestsSumArray;
    
    __weak IBOutlet RequestButton *buttonSum1;
    __weak IBOutlet RequestButton *buttonSum2;
    __weak IBOutlet RequestButton *buttonSum3;
    __weak IBOutlet RequestButton *buttonSum4;
    __weak IBOutlet RequestButton *buttonSum5;
    __weak IBOutlet RequestButton *buttonSum6;

    Client* selectedClient;
    Card* selectedCard;
    VerifyWebView* threeDSView;
}

@end
