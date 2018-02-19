//
//  InviteViewController.m
//  PayApp
//
//  Created by Alexey on 02.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "InviteViewController.h"
#import "ClientManager.h"

@interface InviteViewController ()

@end

@implementation InviteViewController

- (void)viewDidLoad {
    self.title = NSLocalizedString(@"invite", nil);
    [self showBackButton];
    [self ajustView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)ajustView
{
    contactTextField.placeholder   =  NSLocalizedString(@"contactInvite", nil);
    contactTextField.delegate = self;

    [sendInviteButton setTitle:NSLocalizedString(@"sendInvite", nil) forState:UIControlStateNormal];
    [sendInviteButton setTitle:NSLocalizedString(@"sendInvite", nil) forState:UIControlStateHighlighted];
    [sendInviteButton setTitle:NSLocalizedString(@"sendInvite", nil) forState:UIControlStateSelected];
}

- (IBAction)sendInviteButtonClick:(id)sender
{
    if (contactTextField.text && contactTextField.text.length>0)
    {
     [self showLoading];
     [CLIENT_MANAGER addClient:contactTextField.text withCompletion:^(id addClientAnswer, NSError *error) {
         [self hideLoading];
         if (!error)
         {
             [self.navigationController popViewControllerAnimated:YES];
         }else
          [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"inviteError", nil) completion:nil];
         }];
    }else
        [self showAlertWithMessage:NSLocalizedString(@"enptyLoginTextField", nil) completion:nil];    
}


-(void)dismissKeyboard
{
    [contactTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
