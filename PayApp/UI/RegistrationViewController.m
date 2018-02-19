//
//  RegistrationViewController.m
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "RegistrationViewController.h"
#import "MainViewController.h"
#import "AuthorizationManager.h"
#import "FormatHelper.h"
#import "UIComponenstBuilder.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"register", nil);
    [self showBackButton];
    
    [self.registerButton setTitle:NSLocalizedString(@"makeRegister", nil) forState:UIControlStateNormal];
    [self.registerButton setTitle:NSLocalizedString(@"makeRegister", nil) forState:UIControlStateHighlighted];
    [self.registerButton setTitle:NSLocalizedString(@"makeRegister", nil) forState:UIControlStateSelected];
    
    self.mainScrollView.delegate = self;
    
    contact = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"contact", nil) delegate:self];
    password =[UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"password", nil) delegate:self];
    password.secureTextEntry = YES;
    rePassword = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"rePassword", nil) delegate:self];
    rePassword.secureTextEntry = YES;
    firstName = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"firstName", nil) delegate:self];
    secondName = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"secondName", nil) delegate:self];
    parentName = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"parentName", nil) delegate:self];

    birthDate = [[CustomDatePickerView alloc] initWithFrame:CGRectMake(10, 0, 300, 35)];
    [birthDate setPlaceholder:NSLocalizedString(@"birthDate", nil)];
    birthDate.delegate = self;
    
    sex = [[SexSelectionView alloc] initWithFrame:CGRectMake(10, 0, 300, 100)];

    [self.mainScrollView  addItem:contact];
    [self.mainScrollView  addItem:password];
    [self.mainScrollView  addItem:rePassword];
    [self.mainScrollView  addItem:firstName];
    [self.mainScrollView  addItem:secondName];
    [self.mainScrollView  addItem:parentName];
    [self.mainScrollView  addItem:birthDate];
    [self.mainScrollView  addItem:sex];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (IBAction)registerButtonClick:(id)sender
{
        
    if([self isAllFieldsFilled])
    {
        if (![self isPasswordSame])
        {
            [self showAlertWithMessage:NSLocalizedString(@"passNotEqual", nil) completion:nil];
            return;
        }
        
        [self showLoading];
        [AUTHORIZATION_MANAGER registrNewClientWithLogin:contact.text andPassword:password.text familyName:firstName.text name:secondName.text parentName:parentName.text birthDate:[FormatHelper stringDateFromDate:[birthDate getDate]] sex:[sex selectedSexString] allowProfileView:@"true" andCompletion:^(NSError *error) {
                        [self hideLoading];
                         if (!error){
                                [self showAlertWithMessage:NSLocalizedString(@"completeRegisterMessage", nil) completion:nil];
                                [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeConfirmViewController] animated:YES];
                         }else
                            [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"registrError", nil) completion:nil];
                    }];
    }else
        [self showAlertWithMessage:NSLocalizedString(@"enptyTextField", nil) completion:nil];
    
    
}

-(BOOL)isPasswordSame
{
    return (password.text.length > 0 && rePassword.text.length > 0 && [password.text isEqualToString:rePassword.text]);
}

-(BOOL)isAllFieldsFilled
{
    return  (contact.text.length > 0 && password.text.length > 0 && rePassword.text.length > 0 &&
             firstName.text.length > 0 && secondName.text.length > 0 && parentName.text.length > 0 &&
             [birthDate getSelectedDate].length > 0 && sex.selectedSex>0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [birthDate hideDataPicker];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if ([textField isEqual:contact])
        [password becomeFirstResponder];
    else
        if ([textField isEqual:password])
            [rePassword becomeFirstResponder];
        else
            if ([textField isEqual:rePassword])
                [firstName becomeFirstResponder];
            else
                if ([textField isEqual:firstName])
                    [secondName becomeFirstResponder];
                else
                    if ([textField isEqual:secondName])
                        [parentName becomeFirstResponder];
                    else
                        [textField resignFirstResponder];
    
    return YES;
}

- (void) pickerViewShowed
{
    [self dismissKeyboard];
}
@end
