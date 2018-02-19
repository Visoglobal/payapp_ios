//
//  NSObject+BankAlertView.m
//  MobileAcquiringCore
//
//  Created by админ on 28.03.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import "NSObject+BankAlertView.h"

#define kGoToMainScreenAlertTag 123

@implementation NSObject (BankAlertView)

#pragma mark - Messages

- (NSString*) messageFromError:(NSError*)error
{
    return [self messageFromErrorCode:error.code description:error.localizedDescription hostErrorCode:0 hostDescription:nil];
}

- (NSString*) messageFromErrorCode:(NSInteger)code description:(NSString*)description hostErrorCode:(NSInteger)hostCode hostDescription:(NSString*)hostDescription
{
    NSMutableString * messageString = [NSMutableString string];
    
    BOOL hostErrorExists = hostCode && hostDescription && hostDescription.length != 0;
    BOOL errorExists = description && description.length != 0;
    
    BOOL needsToShowsHostError = [SETTINGS_MANAGER isSupportedFormat:TransactionErrorFormatHost];
    BOOL needsToShowsError = [SETTINGS_MANAGER isSupportedFormat:TransactionErrorFormatServer] || (needsToShowsHostError && !hostErrorExists);

    if (hostErrorExists && needsToShowsHostError)
    {
        [messageString appendFormat: NSLocalizedString(@"Host %i: %@", nil), hostCode, hostDescription];
        [messageString appendString:@"\n\n"];
    }
    
    if (errorExists && needsToShowsError)
    {        
        if (!code)
            [messageString appendFormat: @"%@", description];
        else
            [messageString appendFormat: NSLocalizedString(@"Error %i: %@", nil), code, description];
    }
    
    return messageString;
}

- (void)showCancelAlertWithError:(NSError*)error
{
    [self showCancelAlertWithErrorCode:error.code ErrorDiscription:error.localizedDescription];
}

- (void)showCancelAlertWithError:(NSError*)error delegate:(id)delegate
{
    [self showCancelAlertWithErrorCode:error.code ErrorDiscription:error.localizedDescription delegate:delegate];
}

- (void) showCancelAlertWithError:(NSError*)error completion:(BankAlertButtonSelectionBlock)completion;
{
    [self showCancelAlertWithError:error hostError:nil completion:completion];
}

- (void)showCancelAlertWithErrorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription
{
    [self showCancelAlertWithErrorCode:errorCode ErrorDiscription:errorDiscription delegate:nil];
}

- (void)showCancelAlertWithErrorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription delegate:(id)delegate
{
    [self showCancelAlertWithTitle:nil errorCode:errorCode ErrorDiscription:errorDiscription delegate:delegate];
}

- (void)showCancelAlertWithTitle:(NSString*)title errorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription delegate:(id)delegate
{
    NSString * message = [self messageFromErrorCode:errorCode description:errorDiscription hostErrorCode:0 hostDescription:nil];
    
    [self showAlertViewWithTitle:title message:message delegate:delegate];
}

- (void)showCancelAlertWithError:(NSError*)error hostError:(NSError*)hostError delegate:(id)delegate
{
    [self showCancelAlertWithTitle:nil error:error hostError:hostError delegate:delegate];
}

- (void)showCancelAlertWithTitle:(NSString*)title error:(NSError*)error hostError:(NSError*)hostError delegate:(id)delegate
{
    NSString * message = [self messageFromErrorCode:error.code description:error.localizedDescription hostErrorCode:hostError.code hostDescription:hostError.localizedDescription];
    
    [self showAlertViewWithTitle:title message:message delegate:delegate];
}

- (void)showCancelAlertWithTitle:(NSString*)title error:(NSError*)error hostError:(NSError*)hostError completion:(BankAlertButtonSelectionBlock)completion
{
    NSString * message = [self messageFromErrorCode:error.code description:error.localizedDescription hostErrorCode:hostError.code hostDescription:hostError.localizedDescription];
    
    [self showAlertViewWithTitle:title message:message completion:completion];
}

- (void) showCancelAlertWithError:(NSError*)error hostError:(NSError*)hostError completion:(BankAlertButtonSelectionBlock)completion
{
    [self showCancelAlertWithErrorCode:error.code ErrorDiscription:error.localizedDescription hostErrorCode:hostError.code hostDescription:hostError.localizedDescription completion:completion];
}

- (void)showCancelAlertWithErrorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription hostErrorCode:(NSInteger)hostCode hostDescription:(NSString*)hostDescription delegate:(id)delegate
{
    NSString * message = [self messageFromErrorCode:errorCode description:errorDiscription hostErrorCode:hostCode hostDescription:hostDescription];
    
    [self showAlertViewWithMessage:message delegate:delegate];
}

- (void) showCancelAlertWithErrorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription hostErrorCode:(NSInteger)hostCode hostDescription:(NSString*)hostDescription completion:(BankAlertButtonSelectionBlock)completion
{
    NSString * message = [self messageFromErrorCode:errorCode description:errorDiscription hostErrorCode:hostCode hostDescription:hostDescription];
    
    [self showAlertViewWithMessage:message completion:completion];
}

- (void) showAlertViewWithMessage:(NSString*)message delegate:(id)delegate
{
    [self showAlertViewWithTitle:nil message:message delegate:delegate];
}

- (void) showAlertViewWithTitle:(NSString*)title message:(NSString*)message delegate:(id)delegate
{
    BankAlert * alert = [[BankAlert alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle: NSLocalizedString(@"OK", nil) otherButtons: nil];
    [alert show];
    [alert release];
}

- (void) showAlertViewWithMessage:(NSString*)message completion:(BankAlertButtonSelectionBlock)completion
{
    [self showAlertViewWithTitle:nil message:message completion:completion];
}

- (void) showAlertViewWithTitle:(NSString*)title message:(NSString*)message completion:(BankAlertButtonSelectionBlock)completion
{
    BankAlert * alert = [[BankAlert alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle: NSLocalizedString(@"OK", nil) otherButtons: nil];
    
    alert.completion = completion;
    
    [alert show];
    [alert release];
}

- (void) showAlertViewWithMessage:(NSString*)message
{
    [self showAlertViewWithMessage:message delegate:nil];
}


@end
