//
//  StartAppManager.m
//  PayApp
//
//  Created by Alexey on 06.04.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "StartAppManager.h"
#import "UserManager.h"
#import "AuthorizationManager.h"
#import "BaseViewController.h"
#import "UserStartParamsManager.h"

@implementation StartAppManager

- (id)initWithNavigationController:(UINavigationController*)navigationController
{
    self = [super init];
    if (self) {
        currentNavigationController = navigationController;
        [self start];
    }
    return self;
}

- (id)initMainViewWithNavigationController:(UINavigationController*)navigationController
{
    self = [super init];
    if (self) {
        currentNavigationController = navigationController;
        [self openMainView];
    }
    return self;
}


-(void)start
{
    if (USER_MANAGER.contact.contact && ![USER_MANAGER.contact.contact isEqualToString:@""])
    {
        BaseViewController* viewController = (BaseViewController*)[currentNavigationController.viewControllers lastObject];
//        [viewController showLoading];
        NSString* contact = [USER_MANAGER.contact.contact copy];
        
        [AUTHORIZATION_MANAGER checkLogin:contact withCompletion:^(CheckLoginArswer *loginAnswer, NSError *error) {
            
//            [viewController hideLoading];
            
            if (!error && loginAnswer)
            {
                switch (loginAnswer.stateOfRegistration)
                {
                    case RegistrationStateNeedRegisterFin:
                        [currentNavigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeConfirmViewController] animated:YES];//AppClientRegisterFin
                        break;
                    case RegistrationStateNeedContactConfirmation:
                        [currentNavigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeConfirmViewController] animated:YES];//AppContactConfirmInit
                        break;
                    case RegistrationStateNeedConfirmationCode: //ContactConfirmFin
                    {
                        BaseViewController* authorization = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeAuthorizationViewController];
                        [authorization setViewControllerCompletion:^(id resultObject) {
                            
                            if ([contact isEqualToString:USER_MANAGER.contact.contact])
                                [currentNavigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeConfirmViewController] animated:YES];
                            else
                                [self openMainView];
                            
                        }];
                        [currentNavigationController pushViewController:authorization animated:YES];
                    }
                        break;
                    case RegistrationStateCompleted://completed
                    {
                        BaseViewController* authorization = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeAuthorizationViewController];
                        [authorization setViewControllerCompletion:^(id resultObject) {
                                [self openMainView];
                        }];
                        [currentNavigationController pushViewController:authorization animated:YES];
                    }
                        break;
                }
                
            }
            else
                [viewController showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"checkingError", nil) completion:nil];
            
        }];
    }
    
    //1) need_register_fin - клиент был приглашен, необходим запрос AppClientRegisterFin.
    //2) need_contact_confirmation - у клиента нет подтвержденных контактов, на неподтвержденные контакты не выслан код, необходим запрос AppContactConfirmInit.
    //3) need_confirmation_code - у клиента нет подтвержденных контактов, есть неподтвержденные контакты, на которые выслан код подтверждения, необходим запрос ContactConfirmFin.
    //4) completed - у клиента есть подтвержденные контакты, действия по регистрации не требуются.
   
}

-(void)openMainView
{
    BaseViewController* viewController = (BaseViewController*)[currentNavigationController.viewControllers lastObject];
    [viewController showLoading];
    
    [USER_START_PARAMS_MANAGER updateUserInitDataWithCompletion:^(NSError *error) {
        [viewController hideLoading];
        [currentNavigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeMainViewController] animated:YES];
    }];
}
@end
