//
//  UIFabric.m
//  MobileAcquiringCore
//
//  Created by админ on 10.02.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import "ViewControllerFabric.h"

#import "MainViewController.h"
#import "AuthorizationViewController.h"
#import "StartViewController.h"
#import "RegistrationViewController.h"
#import "ConfirmViewController.h"
#import "OperationsViewController.h"
#import "CardListViewController.h"
#import "ContactViewController.h"
#import "AddCardViewController.h"
#import "InviteViewController.h"
#import "TransactionFilterViewController.h"
#import "DetailViewController.h"
#import "AccountViewController.h"
#import "ApplyTransactionViewController.h"
#import "TransactionViewController.h"
#import "RestoreSessionViewController.h"

#import "XibHelper.h"

@implementation ViewControllerFabric

- (UIViewController*) viewControllerForType:(ViewControllerType)viewControllerType
{
    return [self viewControllerForType:viewControllerType withObject:nil];
}

- (UIViewController*) viewControllerForType:(ViewControllerType)viewControllerType withObject:(id)object
{
    switch (viewControllerType)
    {
            //Language select
        case ViewControllerTypeMainViewController:
            return [[MainViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"MainViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeAuthorizationViewController:
            return [[AuthorizationViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"AuthorizationViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeStartViewController:
            return [[StartViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"StartViewController"] bundle:nil];
            break;
        case ViewControllerTypeRegistrationViewController:
            return [[RegistrationViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"RegistrationViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeConfirmViewController:
            return [[ConfirmViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"ConfirmViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeOperationsViewController:
            return [[OperationsViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"OperationsViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeCardListViewController:
            return [[CardListViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"CardListViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeContactViewController:
            return [[ContactViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"ContactViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeAddCardViewController:
            return [[AddCardViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"AddCardViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeInviteViewController:
            return [[InviteViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"InviteViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeTransactionFilterViewController:
            return [[TransactionFilterViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"TransactionFilterViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeDetailViewController:
            return [[DetailViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"DetailViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeAccountViewController:
            return [[AccountViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"AccountViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeApplyTransactionViewController:
            return [[ApplyTransactionViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"ApplyTransactionViewController"] bundle:nil andObject:object];
            break;
            
        case ViewControllerTypeTransactionViewController:
            return [[TransactionViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"TransactionViewController"] bundle:nil andObject:object];
            break;
        case ViewControllerTypeSessionExpireViewController:
            return [[RestoreSessionViewController alloc] initWithNibName:[XibHelper viewControllerXibNameWithName:@"RestoreSessionViewController"] bundle:nil andObject:object];
            break;
        default:
            return nil;
            break;
    }
}

@end
