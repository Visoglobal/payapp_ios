//
//  ConfirmViewController.m
//  PayApp
//
//  Created by Alexey on 12.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "ConfirmViewController.h"
#import "AuthorizationManager.h"
#import "UserManager.h"
#import "UserStartParamsManager.h"
#import "DeviceHelper.h"

@interface ConfirmViewController ()

@end

@implementation ConfirmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"appName", nil);
    [self showBackButton];
    [self.userImageView setImageInside:[UIImage imageNamed:@"payapp_menu_reg2_user_nonpicture.png" ]];
    
    CGFloat yPos = topImageView.frame.origin.y+topImageView.frame.size.height;
    CGRect viewsFrame = CGRectMake(0, yPos, self.view.frame.size.width, self.view.frame.size.height - bottomImageView.frame.size.height - yPos);
    confirmView = [[AutoDataScroll alloc] initWithFrame:viewsFrame];
    [self ajustConfirmView];
    [self.view addSubview:confirmView];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
}

-(void)ajustConfirmView
{
    confirmCode  = [CustomTextField getTextFieldWithPlaceholder:NSLocalizedString(@"", nil)];
    confirmCode.delegate = self;

    UILabel* descLabel = [[UILabel alloc] initWithFrame:confirmCode.frame];
    descLabel.text = NSLocalizedString(@"enteraccess", nil);
    
    [confirmView addItem:descLabel];
    [confirmView addItem:confirmCode];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registrButtonClick:(id)sender
{
    if ([self isPreviousWasRegistrationController])
        [self doBack];
    else
    {
        NSArray* viewcontrollers = @[self.navigationController.viewControllers[0],[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeRegistrationViewController]];
        self.navigationController.viewControllers = viewcontrollers;
    }
}

-(BOOL)isPreviousWasRegistrationController
{

    UIViewController* previouslyViewController = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    UIViewController* registerViewController = [CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeRegistrationViewController];
    
    if ([previouslyViewController isKindOfClass: [registerViewController class]])
        return YES;
    
    return NO;
}

- (IBAction)enterButtonClick:(id)sender
{
    
    if( confirmCode.text.length > 0 )
    {
        [self showLoading];
        
        [AUTHORIZATION_MANAGER contactConfirmWithCode:confirmCode.text andCompletion:^(NSError *error) {

            if (!error )
            {
                [USER_START_PARAMS_MANAGER updateUserInitDataWithCompletion:^(NSError *error) {
                    [self hideLoading];
                    [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeMainViewController] animated:YES];
                }];

            }else{
                [self hideLoading];
                [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"registrError", nil) completion:nil];
            }
        }];
        
    }else
        [self showAlertWithMessage:NSLocalizedString(@"enptyTextField", nil) completion:nil];


}

-(void)dismissKeyboard
{
    [UIView animateWithDuration:0.1 animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [confirmCode resignFirstResponder];
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
