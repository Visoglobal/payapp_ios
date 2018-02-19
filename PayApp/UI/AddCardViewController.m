//
//  AddCardViewController.m
//  PayApp
//
//  Created by Alexey on 01.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "AddCardViewController.h"
#import "DropDownObject.h"
#import "Card.h"
#import "CardManager.h"
#import "CardRegisterAnswer.h"
#import "UIComponenstBuilder.h"

@interface AddCardViewController ()

@end

@implementation AddCardViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [CardIOUtilities preload];
    [self showBackButton];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    if (initObject)
    {
         self.title = NSLocalizedString(@"editCardTitle", nil);
        [addButton setTitle:NSLocalizedString(@"editButton", nil) forState:UIControlStateNormal];
        [addButton setTitle:NSLocalizedString(@"editButton", nil) forState:UIControlStateHighlighted];
        [addButton setTitle:NSLocalizedString(@"editButton", nil) forState:UIControlStateSelected];
        
        DropDownObject* data = [[DropDownObject alloc] init];
        data.dropName = NSLocalizedString(@"cardStatesTitle", nil);
        data.items = cardStates;
        
        cardStateDropDown = [[CustomDropDownControl alloc] initWithData:data andFrame:CGRectMake(10, self.userInfoView.frame.origin.y + self.userInfoView.frame.size.height+10, 300, 35)];
        cardStateDropDown.delegate = self;
        [_mainScrollView addItem:cardStateDropDown];
    }else
    {

         self.title = NSLocalizedString(@"addCardTitle", nil);
        [addButton setTitle:NSLocalizedString(@"addButton", nil) forState:UIControlStateNormal];
        [addButton setTitle:NSLocalizedString(@"addButton", nil) forState:UIControlStateHighlighted];
        [addButton setTitle:NSLocalizedString(@"addButton", nil) forState:UIControlStateSelected];
        
        DropDownObject* data = [[DropDownObject alloc] init];
        data.dropName = NSLocalizedString(@"cardPaySys", nil);
        data.items = cardSystems;
        
        cardSustemDropDown = [[CustomDropDownControl alloc] initWithData:data andFrame:CGRectMake(10, self.userInfoView.frame.origin.y+self.userInfoView.frame.size.height+10, 300, 35)];
        cardSustemDropDown.delegate = self;
        
        [_mainScrollView addItem:cardSustemDropDown];

        cardPanTextField = [UIComponenstBuilder getTextFieldWithPlaceholder:NSLocalizedString(@"PAN", nil) delegate:self];
        [_mainScrollView addItem:cardPanTextField];
    }
    
    [self ajustView];
    if (initObject)
    {
        Card* card = (Card*)initObject;
    
        cardholderTextField.text = card.cardholderName;
        cardNameTextField.text = card.cardName;
        [cardIsDefaulcheckBox setSelected:card.creditDefault];
        cardStateDropDown.selectedSegmentIndex = [cardStateDropDown getIndexFromValue:card.cardState];
        
        //        expireDate
    }
    [_mainScrollView bringSubviewToFront:initObject?cardStateDropDown:cardSustemDropDown];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAll)];
    [self.view addGestureRecognizer:tap];

}

-(void)ajustView
{
    cardCVC2TextField = [UIComponenstBuilder getTextFieldWithPlaceholder:NSLocalizedString(@"cvc2", nil) delegate:self];
    cardholderTextField = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"Cardholder name", nil) delegate:self];
    cardNameTextField = [UIComponenstBuilder getTextFieldWithPlaceholder:NSLocalizedString(@"cardname", nil) delegate:self];
    
    expireDate = [[CustomMonthYearPickerView alloc] initWithFrame:CGRectMake(10, 0, 300, 35)];
    [expireDate setPlaceholder:NSLocalizedString(@"expireDate", nil)];
    expireDate.delegate = self;

    cardIsDefaulcheckBox = [UIComponenstBuilder getCheckBoxWithTitle:NSLocalizedString(@"useByDefault", nil)];
    
    [_mainScrollView addItem:cardholderTextField];
    [_mainScrollView addItem:cardCVC2TextField];
    [_mainScrollView addItem:cardNameTextField];
    [_mainScrollView addItem:expireDate];
    [_mainScrollView addItem:cardIsDefaulcheckBox];
    
    scanButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, 280, 45)];
    [scanButton setTitle:NSLocalizedString(@"scanButtonTitle", nil) forState:UIControlStateNormal];
    [scanButton setBackgroundImage:[UIImage imageNamed:@"payapp_dobavl_karti1_button_skan.png"] forState:UIControlStateNormal];
    [scanButton setBackgroundImage:[UIImage imageNamed:@"payapp_dobavl_karti1_button_skan_hover.png"] forState:UIControlStateHighlighted];
    [scanButton addTarget:self action:@selector(scanButtonClick) forControlEvents:UIControlEventTouchDown];
    
    [_mainScrollView addItem:scanButton];
    
}

- (void)scanButtonClick
{
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    scanViewController.hideCardIOLogo = YES;
    scanViewController.collectCVV = NO;
    scanViewController.disableManualEntryButtons = YES;
    
    scanViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:scanViewController animated:YES completion:nil];
}

- (IBAction)addButtonClick:(id)sender
{
    if (initObject)
    {
        [self showLoading];
        Card* card = (Card*)initObject;
        [CARD_MANAGER editCardWithName:cardNameTextField.text cardState:cardStates[cardStateDropDown.selectedSegmentIndex] cardId:card.cardId withCreditDefault:cardIsDefaulcheckBox.isSelected?@"true":@"false" withExpiryDate:[FormatHelper stringCardExpireDateFromDate:[expireDate getDate]] withCardholderName:cardholderTextField.text.length>0?cardholderTextField.text:nil  withCvc2:cardCVC2TextField.text.length>0?cardCVC2TextField.text:nil withCompletion:^(id cardsAnswer, NSError *error) {
            [self hideLoading];
            if (!error)
            {
                card.cardState = cardStates[cardStateDropDown.selectedSegmentIndex];
                if(cardStateDropDown.selectedSegmentIndex != 2)
                {
                    card.cardholderName = cardholderTextField.text.length>0?cardholderTextField.text:@"";
                    card.cardName = cardNameTextField.text;
                    card.expiryDate = [FormatHelper stringCardExpireDateFromDate:[expireDate getDate]];
                    card.creditDefault = cardIsDefaulcheckBox.isSelected;
                }else{
                    card.cardPaySys = @"";
                    card.cardholderName = @"";
                    card.expiryDate = @"";
                    card.creditDefault = NO;
                    card.pan = @"";
                }
                [self.navigationController popViewControllerAnimated:YES];
                if(_completion)
                    _completion(card);
            }else
                [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"editErrorMessage", nil) completion:nil];

        }];
    }else
    {
        if(cardSustemDropDown.selectedSegmentIndex >= 0 && cardPanTextField.text && cardPanTextField.text.length>0)
        {
            [self showLoading];
            [CARD_MANAGER  registerNewCardWithName:cardNameTextField.text.length>0?cardNameTextField.text:nil withCardPaySys:cardSystems[cardSustemDropDown.selectedSegmentIndex] withPan:cardPanTextField.text withExpiryDate:[FormatHelper stringCardExpireDateFromDate:[expireDate getDate]] withCardholderName:cardholderTextField.text.length>0?cardholderTextField.text:nil withCvc2:cardCVC2TextField.text.length>0?cardCVC2TextField.text:nil withCreditDefault:cardIsDefaulcheckBox.isSelected?@"true":@"false" withCompletion:^(id cardsAnswer, NSError *error) {
                [self hideLoading];
                if (!error)
                {
                    Card* card = [Card new];
                    card.cardholderName = cardholderTextField.text.length>0?cardholderTextField.text:@"";
                    card.cardName = cardNameTextField.text.length>0?cardNameTextField.text:@"";
                    card.expiryDate = [FormatHelper stringCardExpireDateFromDate:[expireDate getDate]];
                    card.creditDefault = cardIsDefaulcheckBox.isSelected;
                    card.cardId = [(CardRegisterAnswer*)cardsAnswer cardId];
                    card.pan = cardPanTextField.text;
                    card.cardState = cardStates[0];
                    card.cardPaySys = cardSystems[cardSustemDropDown.selectedSegmentIndex];
                        
                    [self.navigationController popViewControllerAnimated:YES];
                    if(_completion)
                        _completion(card);
                    
                }else
                    [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"registerErrorMessage", nil) completion:nil];
            }];
        }else
        {
            [self showAlertWithMessage:NSLocalizedString(@"registerError", nil) completion:nil];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CardIOPaymentViewControllerDelegate

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)paymentViewController {

    if(info.scanned)
    {
        cardPanTextField.text = info.cardNumber;
        int valueIndex = [cardSustemDropDown getIndexFromValue:[CardIOCreditCardInfo displayStringForCardType:info.cardType usingLanguageOrLocale:@"en"]];
        cardSustemDropDown.selectedSegmentIndex = valueIndex;
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setLocale:[NSLocale currentLocale]];
        [formatter setDateFormat:@"MM:yyyy"];
        NSString* dateString = [NSString stringWithFormat:@"%li:%li", info.expiryMonth, info.expiryYear];
        NSDate *date = [formatter dateFromString:dateString];
        [expireDate setDataLableFromDate:date];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)hideAll
{
    [self dismissKeyboard];
    [expireDate hideDataPicker];
}

-(void)dismissKeyboard
{
    NSArray *subviews = [self.mainScrollView subviews];
    for (id objects in subviews) {
        if ([objects isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = objects;
            if ([objects isFirstResponder]) {
                [theTextField resignFirstResponder];
            }
        }
    }
    
    CGPoint pt;
    pt.x = 0;
    pt.y  = 0;    
    [self.mainScrollView setContentOffset:pt animated:YES];
    
    if (cardSustemDropDown) { [cardSustemDropDown slideUp]; }
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [expireDate hideDataPicker];
    
    svos = self.mainScrollView.contentOffset;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:self.mainScrollView];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= (self.mainScrollView.frame.size.height/2 - 150);
    [self.mainScrollView setContentOffset:pt animated:YES];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)aTextField
{

    if (self.mainScrollView.contentSize.height <= self.mainScrollView.frame.size.height){
        
        CGPoint pt;
        pt.x = 0;
        pt.y  = 0;
        
        [self.mainScrollView setContentOffset:pt animated:YES];
    }
    
    return YES;
}

- (void) pickerViewShowed
{
    [self dismissKeyboard];

    svos = self.mainScrollView.contentOffset;
    CGPoint pt;
    CGRect rc = [expireDate bounds];
    rc = [expireDate convertRect:rc toView:self.mainScrollView];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= (self.mainScrollView.frame.size.height/2 - 150);
    [self.mainScrollView setContentOffset:pt animated:YES];
    
}

//<xs:element name="CardName" type="xs:string" minOccurs="0"/>
//<xs:element name="CreditDefault" type="xs:boolean"/>
//<xs:element name="ExpiryDate" type="xs:gYearMonth" minOccurs="0"/>
//<xs:element name="CardholderName" type="xs:date" minOccurs="0"/>
//<xs:element name="CVC2" type="xs:string" minOccurs="0"/>
//
////<xs:element name="CardPaySys" type="ns:tPaySysType"/>
////<xs:element name="PAN" type="xs:string"/>
//
//
//-------
//<xs:element name="CardName" type="xs:string" minOccurs="0"/>
//<xs:element name="CreditDefault" type="xs:boolean" minOccurs="0"/>
//<xs:element name="ExpiryDate" type="xs:gYearMonth" minOccurs="0"/>
//<xs:element name="CardholderName" type="xs:date" minOccurs="0"/>
//<xs:element name="CVC2" type="xs:string" minOccurs="0"/>

////<xs:element name="CardId" type="xs:string"/>
////<xs:element name="CardState" type="ns:tCardState" minOccurs="0"/>

//<xs:restriction base="xs:string">
//<xs:enumeration value="VISA"/>
//<xs:enumeration value="MasterCard"/>
//
//<xs:simpleType name="tCardState">
//<xs:restriction base="xs:string">
//<xs:enumeration value="normal"/>
//<xs:enumeration value="blocked"/>
//<xs:enumeration value="archive"/>

///// American Express
//CardIOCreditCardTypeAmex = '3',
///// Japan Credit Bureau
//CardIOCreditCardTypeJCB = 'J',
///// VISA
//CardIOCreditCardTypeVisa = '4',
///// MasterCard
//CardIOCreditCardTypeMastercard = '5',
///// Discover Card
//CardIOCreditCardTypeDiscover = '6'

@end
