//
//  AppDelegate.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "AppDelegate.h"
#import "StartViewController.h"
#import "PayAppNavigationController.h"
#import "ViewControllerFabric.h"
#import "DeviceHelper.h"
#import "UserManager.h"
#import "StartAppManager.h"
#import "KeyChainManager.h"

#import "TouchIdViewController.h"
#import "PushAlertView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    KEYCHAIN_MANAGER;
    SKIN_MANAGER.filename = @"Skin";
    [CONSTRUCTION_MANAGER setViewControllerFabric:[[ViewControllerFabric alloc] init]];

    //---------
//    TouchIdViewController * rootNavigationController = [[TouchIdViewController alloc] initWithNibName:@"TouchIdViewController" bundle:nil];
    //--------
    
    PayAppNavigationController * rootNavigationController = [[PayAppNavigationController alloc] initWithRootViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeStartViewController]];
    
     self.window.rootViewController = rootNavigationController;
     [self.window makeKeyAndVisible];

    StartAppManager* startManager = [[StartAppManager alloc] initWithNavigationController:rootNavigationController];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(openLoginView)
                                                 name:endSessionNotification
                                               object:nil];
    
    
    if([DeviceHelper isIOS8])
    {
         [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }else{
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }
    return YES;
}

- (void)openLoginView
{
    if ([self.window.rootViewController childViewControllers] && [self.window.rootViewController childViewControllers].count>0)
    {
        UIViewController* controller = (UIViewController*)[self.window.rootViewController childViewControllers][[self.window.rootViewController childViewControllers].count-1];
        UINavigationController* navigationController = controller.navigationController;
        [navigationController popToRootViewControllerAnimated:NO];
        [navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeStartViewController withObject:@"endSession"] animated:NO];
    }

}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken  {
    
    NSLog(@"My token is: %@", deviceToken);
    
    NSString * deviceTokenString = [[[[deviceToken description]
                                      stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                     stringByReplacingOccurrencesOfString: @">" withString: @""]
                                    stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    USER_MANAGER.deviceToken = deviceTokenString;
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Failed to get token, error: %@", error);
}

- (void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"Received notification: %@", userInfo);
    NSDictionary* aps = [userInfo objectForKey:@"aps"];
    if (aps)
    {
        NSDictionary* alert = [aps objectForKey:@"alert"];
        if (alert)
        {
            NSString* body = [alert objectForKey:@"body"];
            NSString* title = [alert objectForKey:@"title"];
            if (body || title) {
                PushAlertView* push = [[PushAlertView alloc] initWithTitle:title andMessage:body];
                [push show];
            }
        }
    }
    [application setApplicationIconBadgeNumber:0];  // set 0 badge number
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
    NSLog(@"URL scheme:%@", [url scheme]);
    NSLog(@"URL query: %@", [url query]);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
