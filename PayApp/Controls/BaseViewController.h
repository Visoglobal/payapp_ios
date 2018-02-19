//
//  BaseViewController.h
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlertView.h"

typedef void(^ViewControllerComplete)(id resultObject);

@interface BaseViewController : UIViewController
{
    UIView* loadingView;
    ViewControllerComplete _completion;
    id initObject;
    CustomAlertView* alert;
}

-(void) showBackButton;
-(void) doBack;
-(void) showAlertWithMessage:(NSString*)message completion:(AlertButtonSelectionBlock)completion;
-(void) showLoading;
-(void) hideLoading;

- (void) setViewControllerCompletion:(ViewControllerComplete)completion;
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andObject:(id)object;
@end
