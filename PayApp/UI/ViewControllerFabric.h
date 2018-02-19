//
//  UIFabric.h
//  MobileAcquiringCore
//
//  Created by админ on 10.02.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    ViewControllerTypeMainViewController,
    ViewControllerTypeAuthorizationViewController,
    ViewControllerTypeStartViewController,
    ViewControllerTypeRegistrationViewController,
    ViewControllerTypeConfirmViewController,
    ViewControllerTypeOperationsViewController,
    ViewControllerTypeCardListViewController,
    ViewControllerTypeContactViewController,
    ViewControllerTypeAddCardViewController,
    ViewControllerTypeInviteViewController,
    ViewControllerTypeTransactionFilterViewController,
    ViewControllerTypeDetailViewController,
    ViewControllerTypeAccountViewController,
    ViewControllerTypeApplyTransactionViewController,
    ViewControllerTypeTransactionViewController,
    ViewControllerTypeSessionExpireViewController
}ViewControllerType;


@protocol ViewControllerFabricMethods <NSObject>

@optional

- (UIViewController*) viewControllerForType:(ViewControllerType)viewControllerType;

@required

- (UIViewController*) viewControllerForType:(ViewControllerType)viewControllerType withObject:(id)object;


@end


@interface ViewControllerFabric : NSObject <ViewControllerFabricMethods>



@end
