//
//  ApplyTransactionViewController.m
//  PayApp
//
//  Created by Alexey on 04.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "ApplyTransactionViewController.h"
#import "ImageHelper.h"
#import "UserManager.h"
#import "ApplyTransaction.h"
#import "TransactionManager.h"
#import "FormatHelper.h"
#import "FeeAnswer.h"

#define itextColor [UIColor colorWithRed:(0/255.0) green:(151/255.0) blue:(172/255.0) alpha:1]
#define iMainColor [UIColor colorWithRed:(33/255.0) green:(138/255.0) blue:(153/255.0) alpha:1]
#define iAdditionalTextColor [UIColor colorWithRed:(100/255.0) green:(101/255.0) blue:(103/255.0) alpha:1]

@interface ApplyTransactionViewController ()
{
    CustomAlertView* feeAlert;
}
@end

@implementation ApplyTransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"applyView", nil);
    [self showBackButton];
    [self ajustView];
    
    [transactionView.userOwner setOnClickAction:[self receiverAction]];
   
    if (initObject) {
        ApplyTransaction* transaction = (ApplyTransaction*)initObject;
        
        if(transaction.transactionStateMode == TransactionStateModeNeedReceiver)
           [transactionView setDirection:TransactionDirectionTypeFromSenderToOwner];
        else
            [transactionView setDirection:TransactionDirectionTypeFromOwnerToSender];
        
        
        transactionView.userSenderName.text = transaction.transactionUser.userFullName;
        [transactionView.userSender setImageInside:[UIImage imageNamed:@"payapp_menu_reg2_user_nonpicture.png"]];

        if (transaction.transactionUser.client.clientId && transaction.transactionUser.client.clientId.length>0)
        {
            NSURL* imageUrl = [ImageHelper getNormalizedImageUrlWithClientId:transaction.transactionUser.client.clientId andSession:USER_MANAGER.sessionId];
            [transactionView.userSender setImageInsideFromUrl:imageUrl];
        }
        if(!transaction.transactionUser.client){
            [transactionView.userSender setImageInside:USER_MANAGER.userPhoto];
        }
        
        [transactionView.userSender setCircleColor:iMainColor];
        [transactionView.userSender setCircleWidth:2];
        
        transactionTitle.text = NSLocalizedString(@"applyTransaction", nil);
        [transactionTitle setFont:boldFontWithSize(14)];
        transactionValue.text = [NSString stringWithFormat:@"%@ %@", [FormatHelper amountInMainUnitsFromMinimalUnits:transaction.transactionUser.own.amount], transaction.transactionUser.own.currency];
        [transactionValue setFont:boldFontWithSize(14)];
        
        comissionTitle.text = NSLocalizedString(@"applyComission", nil);
        [comissionTitle setFont:regularFontWithSize(14)];
        comissionValue.text =  [NSString stringWithFormat:@"%@ %@", [FormatHelper amountInMainUnitsFromMinimalUnits:transaction.transactionUser.own.feeAmount], transaction.transactionUser.own.currency];
        [comissionValue setFont:regularFontWithSize(14)];
    }
}

-(Action)receiverAction
{
    return ^{
        BaseViewController* cardsViewController = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeCardListViewController];
        [cardsViewController setViewControllerCompletion:^(id resultObject) {
            
            selectedCard = (Card*)resultObject;
            
            transactionView.userOwnerName.text = selectedCard.maskedPan;
            [transactionView.userOwner setImageInside:[Card operationsCardLogoForType:[Card cardTypeForCardString:selectedCard.cardPaySys]]];
            
            [transactionView.userOwner setCircleColor:iMainColor];
            [transactionView.userOwner setCircleWidth:2];
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [self.navigationController pushViewController:cardsViewController animated:YES];
    };
}


-(void)ajustView
{
    [transactionView.userOwner setImageInside:[Card operationsCardLogoForType:-1]];
    [transactionView.userOwner setCircleColor:iMainColor];
    [transactionView.userOwner setCircleWidth:2];
    
    transactionView.userOwnerName.text = NSLocalizedString(@"requestCard", nil);
    [transactionView.userOwnerName setTextColor:itextColor];
    [transactionView.userOwnerName setFont:regularFontWithSize(14)];
    
    transactionView.userSenderName.text = NSLocalizedString(@"requestContact", nil);
    [transactionView.userSenderName setTextColor:itextColor];
    [transactionView.userSenderName setFont:regularFontWithSize(14)];
    
    [applyButton setTitle:NSLocalizedString(@"applyAccount", nil) forState:UIControlStateNormal];
    [applyButton setTitle:NSLocalizedString(@"applyAccount", nil) forState:UIControlStateHighlighted];
    [applyButton setTitle:NSLocalizedString(@"applyAccount", nil) forState:UIControlStateSelected];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)applyButtonClick:(id)sender
{
    if (initObject)
    {
        ApplyTransaction* transaction = (ApplyTransaction*)initObject;
        
        if(transaction.transactionStateMode == TransactionStateModeNeedSender)
            [self acceptMoneyAsking];
        else
            [self acceptMoneySending];
    }

}

-(void)acceptMoneySending
{
    if (initObject) {
        ApplyTransaction* transaction = (ApplyTransaction*)initObject;
        
        [self showLoading];
        
        KnownCard* senderKnownCard = [KnownCard new];
        senderKnownCard.cardId = selectedCard.cardId;
        
        Receiver* moneyReceiver = [Receiver new];
        moneyReceiver.knownCard = senderKnownCard;
        
        
        NSString* email = nil;
        NSString* tel = nil;
        
        if ([FormatHelper validateEmail:USER_MANAGER.contact.contact])
            email = USER_MANAGER.contact.contact;
        else
            tel = USER_MANAGER.contact.contact;
        
        [TRANSACTION_MANAGER acceptMoneyAskingFromTransactionWithId:transaction.transactionId toReceiver:moneyReceiver comment:nil allowViewComment:nil phone:tel email:email withCompletion:^(id transactionAnswer, NSError *error) {
            
            [self hideLoading];
            
            if (!error)
                [self.navigationController popViewControllerAnimated:YES];
            else
                [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"checkingError", nil) completion:nil];
        }];
    }else
        [self.navigationController popViewControllerAnimated:YES];
}

-(void)acceptMoneyAsking
{
    if (initObject) {
        ApplyTransaction* transaction = (ApplyTransaction*)initObject;
    
        [self showLoading];
        
        KnownCard* senderKnownCard = [KnownCard new];
        senderKnownCard.cardId = selectedCard.cardId;
        
        Sender* moneySender = [Sender new];
        moneySender.knownCard = senderKnownCard;
        
        Receiver* moneyReceiver = [Receiver new];
        moneyReceiver.clientId = transaction.transactionUser.client.clientId;
        
        NSString* email = nil;
        NSString* tel = nil;
        
        if ([FormatHelper validateEmail:USER_MANAGER.contact.contact])
            email = USER_MANAGER.contact.contact;
        else
            tel = USER_MANAGER.contact.contact;
        
        [TRANSACTION_MANAGER getFeeForAmount:transaction.transactionUser.own.amount sender:moneySender receiver:moneyReceiver withCompletion:^(id transactionAnswer, NSError *error) {
            
            if (!error || error.code == 56)
            {
                NSString* alertMessage = NSLocalizedString(@"comissionGettingError", nil);
                
                if (!error){
                    FeeAnswer* fee = (FeeAnswer*)transactionAnswer;
                    int feeInt = [fee.feeAmount integerValue];
                    NSString* feeStr =[NSString stringWithFormat:@"%.2f",(float)feeInt/100];
                    
                    alertMessage = [NSString stringWithFormat:NSLocalizedString(@"comissionGettingValue %@ %@", nil), feeStr, USER_MANAGER.currency];
                }
                
                feeAlert  = [[CustomAlertView alloc] initWithButtonTitle:NSLocalizedString(@"yesButton", nil) noButtonTitle:NSLocalizedString(@"noButton", nil) title:NSLocalizedString(@"alertTitle", nil) message:alertMessage completion:^(NSInteger buttonIndex) {
                    if (buttonIndex == 1)
                    {
                        
                            [TRANSACTION_MANAGER acceptMoneySendingFromSender:moneySender
                                                                transactionId:transaction.transactionId amount:transaction.transactionUser.own.amount
                                                                     currency:transaction.transactionUser.own.currency comment:nil allowViewComment:nil phone:tel email:email withCompletion:^(id transactionAnswer, NSError *error) {
                                
                                [self hideLoading];
                                
                                if (!error)
                                    [self.navigationController popViewControllerAnimated:YES];
                                else
                                    [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"checkingError", nil) completion:nil];
                                
                            }];
                        
                    }else
                        [self hideLoading];
                }];
                [feeAlert show];
            }else{
                [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"checkingError", nil) completion:nil];
            }
        }];
    }else
        [self.navigationController popViewControllerAnimated:YES];
}

@end
