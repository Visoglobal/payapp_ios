//
//  UINavigationController+ScreenTransition.h
//  MobileAcquiringCore
//
//  Created by админ on 12.02.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ScreenTransition)

- (void) popToOperationsViewController;
- (void) popToMainViewController;
- (void) popToLoginViewController;
- (void) popToWorkflowScreen;
- (void) popToReaderViewController;

- (void) popToViewControllerClass:(Class)aClass;

- (BOOL) currentViewControllerIsKindOfClass:(Class)aClass;

- (void) addViewControllerAsRoot:(UIViewController*)viewController;

- (void) removeViewControllerFromNavigationStack:(UIViewController*)viewController;
- (void) removeViewControllerWithClassFromNavigationStack:(Class)aClass;

- (void) removeAllPreviousControllersFromNavigationStack;

- (BOOL) containViewControllerWithClass:(Class)aClass;


@end
