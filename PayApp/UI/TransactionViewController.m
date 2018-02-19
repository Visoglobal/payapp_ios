//
//  ApplyTransactionViewController.m
//  PayApp
//
//  Created by Alexey on 04.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "TransactionViewController.h"
#import "TransactionManager.h"
#import "ImageHelper.h"
#import "UserManager.h"
#import "FormatHelper.h"
#import "MoneySendAnswer.h"
#import "VerifyWebView.h"
#import "FeeAnswer.h"

#define itextColor [UIColor colorWithRed:(0/255.0) green:(151/255.0) blue:(172/255.0) alpha:1]
#define iMainColor [UIColor colorWithRed:(33/255.0) green:(138/255.0) blue:(153/255.0) alpha:1]
#define iAdditionalTextColor [UIColor colorWithRed:(100/255.0) green:(101/255.0) blue:(103/255.0) alpha:1]

@interface TransactionViewController ()
{
    CustomAlertView* feeAlert;
}
@end

@implementation TransactionViewController

- (void)viewDidLoad
{
    [self showBackButton];
    
    requestsSumArray = @[@"100",@"150",@"200",@"500",@"1000",@"2000"];
    [self fillSummButtons];
    
    [self ajustView];
    [super viewDidLoad];
    
    if (initObject)
    {
        
        TransactionDirectionType transactionType = [initObject integerValue];
        self.title = transactionType?NSLocalizedString(@"transactionRequestMoneyTitle", nil):NSLocalizedString(@"transactionSendMoneyTitle", nil);
        
        [transactionView setDirection:transactionType];
        
        [transactionView.userSender setOnClickAction:[self senderAction]];
        [transactionView.userOwner setOnClickAction:[self receiverAction]];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)doBack
{
    if (!threeDSView || (threeDSView && [threeDSView isHidden]))
        [super doBack];
    else
        threeDSView.hidden = YES;
}

-(Action)senderAction
{
    return ^{
                BaseViewController* contactViewController = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeContactViewController];
                [contactViewController setViewControllerCompletion:^(id resultObject) {
                    
                    selectedClient = (Client*)resultObject;
                    transactionView.userSenderName.text = [NSString stringWithFormat:@"%@ %@",selectedClient.familyName,selectedClient.name];
                    [transactionView.userSender setImageInside:[UIImage imageNamed:@"payapp_menu_reg2_user_nonpicture.png"]];
                    
                    if (selectedClient.clientId && selectedClient.clientId.length>0)
                    {
                        NSURL* imageUrl = [ImageHelper getNormalizedImageUrlWithClientId:selectedClient.clientId andSession:USER_MANAGER.sessionId];
                        [transactionView.userSender setImageInsideFromUrl:imageUrl];
                    }else
                        if (selectedClient.userPhoto)
                            [transactionView.userSender setImageInside:selectedClient.userPhoto];
                    
                    [transactionView.userSender setCircleColor:iMainColor];
                    [transactionView.userSender setCircleWidth:2];
                    [self chekPaymentAvaiblity];
                    [self.navigationController popViewControllerAnimated:YES];
                }];
                [self.navigationController pushViewController:contactViewController animated:YES];
    };
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
            [self chekPaymentAvaiblity];
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [self.navigationController pushViewController:cardsViewController animated:YES];
    };
}

-(void)ajustView
{
    [applyButton setTitle:[NSLocalizedString(@"applyAccount", nil) uppercaseString] forState:UIControlStateNormal];
    
    [transactionView.userOwner setImageInside:[Card operationsCardLogoForType:-1]];
    [transactionView.userOwner setCircleColor:iMainColor];
    [transactionView.userOwner setCircleWidth:2];
    
    transactionView.userOwnerName.text = NSLocalizedString(@"requestCard", nil);
    [transactionView.userOwnerName setTextColor:itextColor];
    [transactionView.userOwnerName setFont:regularFontWithSize(14)];
    
    transactionView.userSenderName.text = NSLocalizedString(@"requestContact", nil);
    [transactionView.userSenderName setTextColor:itextColor];
    [transactionView.userSenderName setFont:regularFontWithSize(14)];    
    
    
    sumLable.text = [NSLocalizedString(@"requestSumm", nil) uppercaseString];
    [sumLable setFont:regularFontWithSize(14)];
    
    [sumTextField setFont:regularFontWithSize(20)];
    [sumTextField setTextColor:[UIColor whiteColor]];
    sumTextField.delegate = self;
    [self setRequestedSum:0.00];

    comissionLable.text = @"";
    [comissionLable setTextColor:iAdditionalTextColor];
    [comissionLable setFont:regularFontWithSize(13)];
    
    warningLable.text = NSLocalizedString(@"alertTitle", nil);
    [warningLable setFont:boldFontWithSize(14)];
    [warningLable setTextColor:[UIColor redColor]];

    additionalComissionLable.text = NSLocalizedString(@"requestAdditionalComission", nil);
    [additionalComissionLable setFont:regularFontWithSize(13)];
    [additionalComissionLable setTextColor:iAdditionalTextColor];
    
    [enterSumView setBackgroundColor:iMainColor];
    [buttonSumView setBackgroundColor:iMainColor];
}

-(void)fillSummButtons
{
    if (requestsSumArray && requestsSumArray.count>=6)
    {
        [buttonSum1 setTitle:requestsSumArray[0] forState:UIControlStateNormal];
        [buttonSum2 setTitle:requestsSumArray[1] forState:UIControlStateNormal];
        [buttonSum3 setTitle:requestsSumArray[2] forState:UIControlStateNormal];
        [buttonSum4 setTitle:requestsSumArray[3] forState:UIControlStateNormal];
        [buttonSum5 setTitle:requestsSumArray[4] forState:UIControlStateNormal];
        [buttonSum6 setTitle:requestsSumArray[5] forState:UIControlStateNormal];
    }
}


- (void)setRequestedSum:(float)sum
{
    requestedSumValue = sum;
    
    [self chekPaymentAvaiblity];
    
    NSString *text = [NSString stringWithFormat:@"%.2f %@",
                       requestedSumValue,
                       NSLocalizedString(@"cyrrencyShortName", nil)];
    
    if ([sumTextField respondsToSelector:@selector(setAttributedText:)]) {
        
        NSDictionary *attribs = @{ NSForegroundColorAttributeName: [UIColor whiteColor],
                                  NSFontAttributeName: regularFontWithSize(20) };
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text attributes:attribs];
        
        NSRange shortTextRange = [text rangeOfString:NSLocalizedString(@"cyrrencyShortName", nil)];
        [attributedText setAttributes:@{NSFontAttributeName:regularFontWithSize(12)}
                                range:shortTextRange];
    
        sumTextField.attributedText = attributedText;
    }
    else {
        sumTextField.text = text;
    }
}

-(void)chekPaymentAvaiblity
{
    [applyButton setEnabled:NO];
    if (requestedSumValue > 0 && [self isContactSelected] && selectedClient)
    {
        if([transactionView getDirection] != TransactionDirectionTypeFromOwnerToSender ||
           ([transactionView getDirection] == TransactionDirectionTypeFromOwnerToSender && selectedCard != nil))
            [applyButton setEnabled:YES];
    }
}

-(BOOL)isContactSelected
{
    return YES;
}

-(void)dismissKeyboard
{
    [sumTextField resignFirstResponder];
    [self setRequestedSum:requestedSumValue];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([sumTextField respondsToSelector:@selector(setAttributedText:)])
    {
        NSDictionary *attribs = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                  NSFontAttributeName: regularFontWithSize(20)};
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.2f",requestedSumValue] attributes:attribs];
        
        sumTextField.attributedText = attributedText;
    }
    else {
        sumTextField.text = [NSString stringWithFormat:@"%.2f",requestedSumValue];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString* newVal =  textField.text;
    newVal = [newVal stringByReplacingOccurrencesOfString:@"," withString:@"."];
    float floatVal = [newVal floatValue];
    double rounded = round (floatVal * 100.0) / 100.0;
    if (rounded>0.01)
        requestedSumValue = rounded;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sumButtonClick:(UIButton*)sender
{
    [self setRequestedSum:[sender.titleLabel.text floatValue]];
}

- (IBAction)applyButtonClick:(id)sender
{
    
    TransactionDirectionType transactionType = [initObject integerValue];
    if (transactionType == TransactionDirectionTypeFromOwnerToSender)
    {
        [self sendMoney];
    }else{
        [self askMoney];
    }
    
}

-(void)sendMoney
{
    KnownCard* senderKnownCard = [KnownCard new];
    senderKnownCard.cardId = selectedCard.cardId;
    
    Sender* moneySender = [Sender new];
    moneySender.knownCard = senderKnownCard;
    
    Receiver* moneyReceiver = [Receiver new];
    moneyReceiver.clientId = selectedClient.clientId;
    
    [self showLoading];
    
    double amount  = round(requestedSumValue*100);

    float minfeeValue = USER_MANAGER.transactionMinFeeValue? [USER_MANAGER.transactionMinFeeValue floatValue]:0;
    float feeTrans = USER_MANAGER.transactionFee? [USER_MANAGER.transactionFee floatValue]:0;
    
    float caclFeeAmount = feeTrans * amount;
    float currFeeValue = minfeeValue>caclFeeAmount?minfeeValue:caclFeeAmount;
        
    NSString* amo = [NSString stringWithFormat:@"%i",(int)amount];
    NSString* fee = [NSString stringWithFormat:@"%i",(int)round(currFeeValue)];
    NSString* email = nil;
    NSString* tel = nil;
    
    if ([FormatHelper validateEmail:USER_MANAGER.contact.contact])
        email = USER_MANAGER.contact.contact;
    else
        tel = USER_MANAGER.contact.contact;

    [TRANSACTION_MANAGER getFeeForAmount:amo sender:moneySender receiver:moneyReceiver withCompletion:^(id transactionAnswer, NSError *error) {

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
                    [TRANSACTION_MANAGER sendMoneyFromSender:moneySender toReceiver:moneyReceiver amount:amo currency:USER_MANAGER.currency expiryDate:nil comment:nil allowViewComment:nil phone:tel email:email withCompletion:^(id transactionAnswer, NSError *error) {
                        
                        [self hideLoading];
                        
                        if (!error)
                        {
                            MoneySendAnswer* answer = (MoneySendAnswer*)transactionAnswer;
                            if (answer && answer.verify)
                            {
                                if (!threeDSView)
                                    [self createVeifyWebView];
                                [threeDSView setVerify:answer.verify];
                                [threeDSView setHidden:NO];
                                [self.view addSubview:threeDSView];
                            }else
                                [self.navigationController popViewControllerAnimated:YES];
                        }else
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
}

-(void)createVeifyWebView
{
    CGRect frame = CGRectMake(0, 55, self.view.frame.size.width, self.view.frame.size.height-55);
    
    threeDSView = [[VerifyWebView alloc] initWithFrame:frame];
    
    [threeDSView setCompletion:^(BOOL success) {
        
        if (!success)
        {
            [threeDSView removeFromSuperview];
            alert = [[CustomAlertView alloc] initWithButtonTitle:NSLocalizedString(@"yesButton", nil) title:NSLocalizedString(@"alertTitle", nil) message:NSLocalizedString(@"transaction failed", nil) completion:nil];
            [alert  show];
        }else
        {
            
            [self.navigationController popViewControllerAnimated:YES];
            alert = [[CustomAlertView alloc] initWithButtonTitle:NSLocalizedString(@"yesButton", nil) title:NSLocalizedString(@"alertTitle", nil) message:NSLocalizedString(@"transaction processed", nil) completion:nil];
            [alert  show];
            
        }        
    }];
    [self.view addSubview:threeDSView];
}

-(void)askMoney
{

    KnownCard* receiverKnownCard = [KnownCard new];
    receiverKnownCard.cardId = selectedCard.cardId;
    
    MoneyAskReceiver* moneyReceiver = [MoneyAskReceiver new];
    moneyReceiver.knownCard = receiverKnownCard;
    
    MoneyAskSender* moneySender = [MoneyAskSender new];
    moneySender.clientId = selectedClient.clientId;
    
    [self showLoading];
    
    double amount  = round(requestedSumValue*100);
    NSString* amo = [NSString stringWithFormat:@"%i",(int)amount];
    NSString* email = nil;
    NSString* tel = nil;
    
    if ([FormatHelper validateEmail:USER_MANAGER.contact.contact])
        email = USER_MANAGER.contact.contact;
    else
        tel = USER_MANAGER.contact.contact;
    
    [TRANSACTION_MANAGER askMoneyFromSender:moneySender toReceiver:moneyReceiver amount:amo currency:USER_MANAGER.currency expiryDate:nil comment:nil allowViewComment:nil phone:tel email:email withCompletion:^(id transactionAnswer, NSError *error) {
        
        [self hideLoading];
        
        if (!error)
            [self.navigationController popViewControllerAnimated:YES];
        else
            [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"checkingError", nil) completion:nil];
        
    }];
}

@end
