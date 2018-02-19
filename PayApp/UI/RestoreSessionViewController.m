//
//  RestoreSessionViewController.m
//  PayApp
//
//  Created by Alexey on 29.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "RestoreSessionViewController.h"
#import "UIComponenstBuilder.h"
#import "AuthorizationManager.h"
#import "UserManager.h"

@interface RestoreSessionViewController ()

@end

@implementation RestoreSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView* header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"payApp_view_header.png"]];
    UILabel* viewTitleLable = [[UILabel alloc] initWithFrame:header.frame];
    viewTitleLable.text = NSLocalizedString(@"sessionRestore", nil);
    [viewTitleLable setTextColor:[UIColor whiteColor]];
    [viewTitleLable setTextAlignment:NSTextAlignmentCenter];
    
    passwordTextField = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"password", nil) delegate:self];
    passwordTextField.frame = CGRectMake( passwordTextField.frame.origin.x, self.userInfoView.frame.size.height+self.userInfoView.frame.origin.y+10 , passwordTextField.frame.size.width, 35);
    passwordTextField.secureTextEntry = YES;
    
    errorMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, passwordTextField.frame.size.height+passwordTextField.frame.origin.y+10, 300, 50)];
    
    if (initObject)
        errorMessageLabel.text = initObject;
    
    [self.view addSubview:header];
    [self.view addSubview:viewTitleLable];
    [self.view addSubview:passwordTextField];
    [self.view addSubview:errorMessageLabel];
    
    [self setTitle:NSLocalizedString(@"enterButton", nil) forButton:connectButton];
    [self setTitle:NSLocalizedString(@"sessionChangeUser", nil) forButton:exitButton];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(IBAction)doConnect:(id)sender
{
    if( passwordTextField.text.length > 0){
        [self showLoading];
        [AUTHORIZATION_MANAGER authorizeWithLogin:USER_MANAGER.contact.contact andPassword:passwordTextField.text andCompletion:^(NSError *error) {
            [self hideLoading];
            if (!error)
                [self dismissViewControllerAnimated:YES completion:nil];
            else
                [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"authorizeError", nil) completion:nil];
        }];
    }else
        [self showAlertWithMessage:NSLocalizedString(@"enptyTextField", nil) completion:nil];
}

-(IBAction)doExit:(id)sender
{
    if (_completion)
        _completion(nil);
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTitle:(NSString *)title forButton:(UIButton*)button
{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateSelected];
}

-(void)dismissKeyboard
{
    [passwordTextField resignFirstResponder];
}

@end
