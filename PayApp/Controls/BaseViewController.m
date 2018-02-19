//
//  BaseViewController.m
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andObject:(id)object
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        initObject = object;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    loadingView = [self createLoadingView];
    UIImage* logoImage = [UIImage imageNamed:@"payapp_menu_reg_logo_up.png"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:logoImage landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    [self.navigationItem.rightBarButtonItem setBackgroundVerticalPositionAdjustment:-3 forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setViewControllerCompletion:(ViewControllerComplete)completion
{
    _completion = completion;
}

-(UIView*)createLoadingView
{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    if (!window)
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    
    UIView* loading = [[UIView alloc] initWithFrame:window.frame];
    [loading setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
    UIActivityIndicatorView* indicator = [UIActivityIndicatorView new];
    [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [indicator setColor:[UIColor redColor]];
    indicator.frame = CGRectMake((loading.frame.size.width -indicator.frame.size.width)/2 , (loading.frame.size.height -indicator.frame.size.height)/2, indicator.frame.size.width, indicator.frame.size.height);
    [indicator startAnimating];
    [loading addSubview:indicator];
    
    return loading;
}

-(void) showBackButton
{
    UIImage* logoImage = [UIImage imageNamed:@"payapp_menu_arrow.png"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:logoImage landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:self action:@selector(doBack)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    [self.navigationItem.leftBarButtonItem setBackgroundVerticalPositionAdjustment:-3 forBarMetrics:UIBarMetricsDefault];
}

-(void)doBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)showAlertWithMessage:(NSString*)message completion:(AlertButtonSelectionBlock)completion
{
    if (alert)
        alert = nil;
    
     alert = [[CustomAlertView alloc] initWithButtonTitle: NSLocalizedString(@"alertOkButtonTitle", nil) title:NSLocalizedString(@"alertTitle", nil) message:message completion:completion];
    [alert show];
};

-(void) showLoading
{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    if (!window)
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    
    if (!loadingView)
        loadingView = [self createLoadingView];
    [[[window subviews] objectAtIndex:0] addSubview:loadingView];
}

-(void) hideLoading
{
    if (loadingView){
        [loadingView removeFromSuperview];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self dismissKeyboard];
    return YES;
}

-(void)dismissKeyboard
{
}
@end
