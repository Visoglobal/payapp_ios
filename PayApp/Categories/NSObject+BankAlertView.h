//
//  NSObject+BankAlertView.h
//  MobileAcquiringCore
//
//  Created by админ on 28.03.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankAlert.h"

@interface NSObject (BankAlertView)

- (void) showCancelAlertWithError:(NSError*)error;
- (void) showCancelAlertWithError:(NSError*)error delegate:(id)delegate;
- (void) showCancelAlertWithError:(NSError*)error completion:(BankAlertButtonSelectionBlock)completion;

- (void) showCancelAlertWithError:(NSError*)error hostError:(NSError*)hostError delegate:(id)delegate;
- (void) showCancelAlertWithError:(NSError*)error hostError:(NSError*)hostError completion:(BankAlertButtonSelectionBlock)completion;

- (void) showAlertViewWithMessage:(NSString*)message;
- (void) showAlertViewWithMessage:(NSString*)message delegate:(id)delegate;
- (void) showAlertViewWithMessage:(NSString*)message completion:(BankAlertButtonSelectionBlock)completion;


- (void) showCancelAlertWithErrorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription;
- (void) showCancelAlertWithErrorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription delegate:(id)delegate;

- (void) showCancelAlertWithErrorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription hostErrorCode:(NSInteger)hostCode hostDescription:(NSString*)hostDescription delegate:(id)delegate;
- (void) showCancelAlertWithErrorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription hostErrorCode:(NSInteger)hostCode hostDescription:(NSString*)hostDescription completion:(BankAlertButtonSelectionBlock)completion;

- (void)showCancelAlertWithTitle:(NSString*)title errorCode:(NSInteger)errorCode ErrorDiscription:(NSString*)errorDiscription delegate:(id)delegate;
- (void)showCancelAlertWithTitle:(NSString*)title error:(NSError*)error hostError:(NSError*)hostError delegate:(id)delegate;
- (void)showCancelAlertWithTitle:(NSString*)title error:(NSError*)error hostError:(NSError*)hostError completion:(BankAlertButtonSelectionBlock)completion;

@end
