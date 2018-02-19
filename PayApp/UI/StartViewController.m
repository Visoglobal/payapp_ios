//
//  StartViewController.m
//  PayApp
//
//  Created by Alexey on 06.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "StartViewController.h"
#import "AuthorizationViewController.h"
#import "RegistrationViewController.h"
#import "UserManager.h"
#import "AuthorizationManager.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self ajustView];
    self.title = NSLocalizedString(@"appName", nil);
}

-(void)ajustView
{
    navBarBgImageView.image = [UIImage imageNamed:@"payapp_menu_reg_bg_up.png"];
    backgroundImageView.image = [UIImage imageNamed:@"payapp_menu_reg_bg.png"];
    logoImageView.image = [UIImage imageNamed:@"payapp_menu_reg_logo_big.png"];
    buttonBarImageView.image = [UIImage imageNamed:@"payapp_menu_reg_bg_down.png"];
    [registrButton setTitle:NSLocalizedString(@"makeRegister", nil) forState:UIControlStateNormal];
    [registrButton setTitle:NSLocalizedString(@"makeRegister", nil) forState:UIControlStateHighlighted];
    [registrButton setTitle:NSLocalizedString(@"makeRegister", nil) forState:UIControlStateSelected];
    
    NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"oldUser", nil)];
    
    NSString* butName = NSLocalizedString(@"oldUser", nil);
    NSRange range = [butName rangeOfString: @" " options: NSBackwardsSearch];
    range.length = butName.length - range.location;
    
    UIFont *font_regular=[UIFont fontWithName:@"Helvetica" size:18.0f];
    UIFont *font_bold=[UIFont fontWithName:@"Helvetica-Bold" size:18.0f];
    
    [attString addAttribute:NSFontAttributeName value:font_regular range:NSMakeRange(0, range.location)];
    [attString addAttribute:NSFontAttributeName value:font_bold range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attString.length)];
    
    [loginButton setAttributedTitle:attString forState:UIControlStateNormal];
    [loginButton setAttributedTitle:attString forState:UIControlStateHighlighted];
    [loginButton setAttributedTitle:attString forState:UIControlStateSelected];
}

- (IBAction)registrButtonClick:(id)sender
{
    [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeRegistrationViewController] animated:YES];
}

- (IBAction)authorizationButtonClick:(id)sender
{
    [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeAuthorizationViewController] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
