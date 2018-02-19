//
//  AuthorizationViewController.m
//  PayApp
//
//  Created by Alexey on 06.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "AuthorizationViewController.h"
#import "RegistrationViewController.h"
#import "ClearButton.h"
#import "MainViewController.h"
#import "AuthorizationManager.h"
#import "UserManager.h"
#import "DeviceHelper.h"
#import "StartAppManager.h"

@interface AuthorizationViewController ()

@end

@implementation AuthorizationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"appName", nil);
    [self showBackButton];
    CGFloat yPos = topImageView.frame.origin.y+topImageView.frame.size.height;
    CGRect viewsFrame = CGRectMake(0, yPos, self.view.frame.size.width, self.view.frame.size.height - bottomImageView.frame.size.height - yPos);
    loginView = [[AutoDataScroll alloc] initWithFrame:viewsFrame];
    accessView = [[AutoDataScroll alloc] initWithFrame:viewsFrame];
    accessView.hidden = YES;
    confirmView = [[AutoDataScroll alloc] initWithFrame:viewsFrame];
    confirmView.hidden = YES;
    [self ajustLoginView];
    [self ajustAccessView];
    [self ajustConfirmView];
    
    if (initObject) {
        userNameLabel.text = @"";
        if (USER_MANAGER.contact.contact && ![USER_MANAGER.contact.contact isEqualToString:@""])
            contact.text = @"";
    }else
    {
        [self.userImageView setImageInside:USER_MANAGER.userPhoto];
        userNameLabel.text = [NSString stringWithFormat:@"%@ %@", USER_MANAGER.contact.firstName, USER_MANAGER.contact.secondName];
        if (USER_MANAGER.contact.contact && ![USER_MANAGER.contact.contact isEqualToString:@""])
            contact.text = USER_MANAGER.contact.contact;
    }
    
    
    [self.view addSubview:loginView];
    [self.view addSubview:accessView];
    [self.view addSubview:confirmView];
    
    currentVisibleView = loginView;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)ajustLoginView
{
    contact  = [CustomTextField getTextFieldWithPlaceholder:NSLocalizedString(@"contact", nil)];
    contact.delegate = self;
    password = [CustomTextField getTextFieldWithPlaceholder:NSLocalizedString(@"password", nil)];
    password.delegate = self;
    password.secureTextEntry = YES;
    ClearButton* forgotButton = [[ClearButton alloc] initWithFrame:contact.frame];
    [self setTitle:NSLocalizedString(@"forgetpass", nil) forButton:forgotButton];
    [forgotButton handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        access.text = contact.text;
        [self showAccessViewWithDirection:UIUserInterfaceLayoutDirectionRightToLeft];
    }];
    [loginView addItem:contact];
    [loginView addItem:password];
    [loginView addItem:forgotButton];
}

-(void)ajustAccessView
{
    UILabel* descLabel = [[UILabel alloc] initWithFrame:contact.frame];
    descLabel.text = NSLocalizedString(@"returnaccess", nil);
    [accessView addItem:descLabel];
    access = [CustomTextField getTextFieldWithPlaceholder:NSLocalizedString(@"contact", nil)];
    access.delegate = self;
    [accessView addItem:access];
}

-(void)ajustConfirmView
{
    UILabel* descLabel = [[UILabel alloc] initWithFrame:contact.frame];
    descLabel.text = NSLocalizedString(@"enteraccess", nil);
    [confirmView addItem:descLabel];
    confirmCode  = [CustomTextField getTextFieldWithPlaceholder:NSLocalizedString(@"", nil)];
    confirmCode.delegate = self;
    [confirmView addItem:confirmCode];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registrButtonClick:(id)sender
{
    [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeRegistrationViewController] animated:YES];
}

- (IBAction)enterButtonClick:(id)sender {
 
    if ([currentVisibleView isEqual:loginView])
                [self authorizeWithLogin:contact.text andPassword:password.text];
    else if ([currentVisibleView isEqual:accessView])
                        [self restorePasswordForLogin:access.text];
         else if ([currentVisibleView isEqual:confirmView])
                    [self authorizeWithLogin:access.text andPassword:confirmCode.text];
}

-(void)restorePasswordForLogin:(NSString*)login
{
    if( login.length > 0 ){
        [self showLoading];
        [AUTHORIZATION_MANAGER restorePasswordForLogin:login withCompletion:^(NSError *error) {
            
            [self hideLoading];
            if (!error){
                [self showAlertWithMessage:NSLocalizedString(@"restorePassMessage", nil) completion:nil];
//                [self showConfirmView];
                [self showLoginView];
            }else
                [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"checkingError", nil) completion:nil];
        }];
    }else
        [self showAlertWithMessage:NSLocalizedString(@"enptyLoginTextField", nil) completion:nil];
 
}

-(void)authorizeWithLogin:(NSString*)loginStr andPassword:(NSString *)passwordStr
{
    if( loginStr.length > 0 && passwordStr.length > 0){
        [self showLoading];
        [AUTHORIZATION_MANAGER authorizeWithLogin:loginStr andPassword:passwordStr andCompletion:^(NSError *error) {            
            if (!error){
                [self hideLoading];
                if (_completion)
                    _completion(nil);
                else
                    [[StartAppManager alloc] initMainViewWithNavigationController:self.navigationController];
            }
            else{
                [self hideLoading];
                [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"authorizeError", nil) completion:nil];
            }
        }];
    }else
        [self showAlertWithMessage:NSLocalizedString(@"enptyTextField", nil) completion:nil];
}

-(void)doBack
{
    if (!loginView.isHidden)
        [super doBack];
    if (!accessView.isHidden)
        [self showLoginView];
    if (!confirmView.isHidden)
        [self showAccessViewWithDirection:UIUserInterfaceLayoutDirectionLeftToRight];
}

-(void)setTitle:(NSString *)title forButton:(UIButton*)button
{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateSelected];
}

-(void)showLoginView
{
    [self setTitle:NSLocalizedString(@"enterButton", nil) forButton:enterButton];
    [self slideOldView:currentVisibleView withNewView:loginView andDirection:UIUserInterfaceLayoutDirectionLeftToRight];
}

-(void)showAccessViewWithDirection:(UIUserInterfaceLayoutDirection)direction
{
    [self setTitle:NSLocalizedString(@"repairButton", nil) forButton:enterButton];
    [self slideOldView:currentVisibleView withNewView:accessView andDirection:direction];
}

-(void)showConfirmView
{
    [self setTitle:NSLocalizedString(@"repairButton", nil) forButton:enterButton];
    [self slideOldView:currentVisibleView withNewView:confirmView andDirection:UIUserInterfaceLayoutDirectionRightToLeft];
}

-(void)slideOldView:(UIView*)oldView withNewView:(UIView*)newView andDirection:(UIUserInterfaceLayoutDirection)direction
{
    
    oldView.frame = CGRectMake(0, oldView.frame.origin.y, oldView.frame.size.width, oldView.frame.size.height);
    newView.frame = CGRectMake(direction?self.view.frame.size.width:-newView.frame.size.width, newView.frame.origin.y, newView.frame.size.width, newView.frame.size.height);

    newView.hidden = NO;
    oldView.hidden = NO;

    [UIView animateWithDuration:0.3 animations:^{
        oldView.frame = CGRectMake(direction?-oldView.frame.size.width:self.view.frame.size.width, oldView.frame.origin.y, oldView.frame.size.width, oldView.frame.size.height);
        newView.frame = CGRectMake(0, newView.frame.origin.y, newView.frame.size.width, newView.frame.size.height);
    } completion:^(BOOL finished) {
        oldView.hidden = YES;
        currentVisibleView = newView;
    }];
}

-(void)dismissKeyboard
{
    [UIView animateWithDuration:0.1 animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [contact resignFirstResponder];
        [confirmCode resignFirstResponder];
        [password resignFirstResponder];
        [access resignFirstResponder];
    } completion:^(BOOL finished){
    }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([DeviceHelper isIphone4])
    {
        CGPoint pt;
        CGRect rc = [textField bounds];
        rc = [textField convertRect:rc toView:self.view];
        pt = rc.origin;
        pt.x = 0;
        pt.y = -(self.view.frame.size.height/2 - (rc.origin.y+rc.size.height));
        
        [UIView animateWithDuration:0.1 animations:^{
            self.view.frame = CGRectMake(0, -pt.y, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished){}];
    }
}


@end
