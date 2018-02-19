//
//  HttpRequestSOAPResponseAnalizer.m
//  PayApp
//
//  Created by Alexey on 28.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "HttpRequestSOAPResponseAnalizer.h"
#import "BaseViewController.h"

#define kElementFault @"faultcode"
#define kElementMessage @"faultstring"
#define kEndSession   @"SOAP-ENV:16" //endSession
#define kNotFoundSession   @"SOAP-ENV:15" //sessionNotFound

@implementation HttpRequestSOAPResponseAnalizer

- (void) constructHandlerWithResponseDictionary:(NSDictionary*)responseDictionary
{
    _operationResult = RequestOperationResultSuccess;
    
    if (!responseDictionary || [responseDictionary allKeys].count != 1)
    {
        _operationResult = RequestOperationResultError;
        return;
    }
    
    NSDictionary* root = [responseDictionary allValues].count > 0? [[responseDictionary allValues] objectAtIndex:0]:[NSDictionary new];
    NSString* faultCode = [root objectForKey:kElementFault];
    
    if (faultCode)
    {
        _operationResult = RequestOperationResultError;
        NSString* errorMessage = [root objectForKey:kElementMessage];
        
        if([faultCode isEqualToString:kEndSession] ||
           [faultCode isEqualToString:kNotFoundSession])
            [self pushEndSessionWithMessage:errorMessage];
        
        return;
    }
}

-(void)pushEndSessionWithMessage:(NSString*)message
{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    if (!window)
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    
    BaseViewController* controller = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeSessionExpireViewController withObject:message];
    [controller setViewControllerCompletion:^(id resultObject){
        [[NSNotificationCenter defaultCenter] postNotificationName:endSessionNotification object:nil];
    }];

    [window.rootViewController presentViewController:controller animated:YES completion:nil];
}

@end
