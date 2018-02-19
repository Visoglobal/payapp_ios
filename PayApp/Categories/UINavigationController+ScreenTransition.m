//
//  UINavigationController+ScreenTransition.m
//  MobileAcquiringCore
//
//  Created by админ on 12.02.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import "UINavigationController+ScreenTransition.h"

@implementation UINavigationController (ScreenTransition)

- (void) popToMainViewController
{
    [self popToViewControllerClass:[NSClassFromString(@"MainScreenViewController") class]];
}

- (void) popToOperationsViewController
{
    [self popToViewControllerClass:[NSClassFromString(@"ServiceSelectorViewController") class]];
}

- (void) popToLoginViewController
{
    [self popToRootViewControllerAnimated:NO];
}

- (void) popToWorkflowScreen
{
    [self popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
}

- (void) popToReaderViewController
{
    [self popToViewControllerClass:[NSClassFromString(@"ReaderViewController") class]];
}

- (void) popToViewControllerClass:(Class)class
{
    [self popToViewController:[self viewControllerForClass:class] animated:YES];
}

- (UIViewController*) viewControllerForClass:(Class)class
{
    for (UIViewController * oneViewController in self.viewControllers)
    {
        if ([oneViewController isKindOfClass: class])
            return oneViewController;
    }
    
    DLog(@"Can't find viewController '%@' in navigation stack", [class description]);
    
    return nil;
}

- (void) removeViewControllerFromNavigationStack:(UIViewController*)viewController
{
    if (viewController != nil)
    {
        NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.viewControllers];
        
        [navigationArray removeObject:viewController];
        
        self.viewControllers = navigationArray;
        [navigationArray release];
    }
}

- (void) removeViewControllerWithClassFromNavigationStack:(Class)aClass
{
    UIViewController * findedController = [self viewControllerForClass:aClass];
    
    if (findedController)
    {
        NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.viewControllers];

        [navigationArray removeObject:findedController];
        
        self.viewControllers = navigationArray;
        [navigationArray release];
    }
}

- (void) removeAllPreviousControllersFromNavigationStack
{
    if (self.viewControllers != nil && self.viewControllers.count > 1)
    {
        NSArray * newViewControllers = [NSArray arrayWithObject:self.viewControllers.lastObject];
        
        self.viewControllers = newViewControllers;
    }
}

- (void) addViewControllerAsRoot:(UIViewController*)viewController
{
    NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.viewControllers];
    
    [navigationArray insertObject:viewController atIndex:0];
    
    self.viewControllers = navigationArray;
    [navigationArray release];
}

- (BOOL) currentViewControllerIsKindOfClass:(Class)aClass
{
    return [self.viewControllers.lastObject isKindOfClass:aClass];
}

- (BOOL) containViewControllerWithClass:(Class)aClass
{
    return [self viewControllerForClass:aClass] != nil;
}

@end
