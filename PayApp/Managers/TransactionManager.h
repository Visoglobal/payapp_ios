//
//  TransactionManager.h
//  PayApp
//
//  Created by Alexey on 10.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "Sender.h"
#import "Receiver.h"
#import "MoneyAskReceiver.h"
#import "MoneyAskSender.h"

#define TRANSACTION_MANAGER [TransactionManager sharedTransactionManager]

@interface TransactionManager : BaseManager

+ (instancetype) sharedTransactionManager;

- (void) getTransactionsFromPage:(NSString*)pageNum
                        dateFrom:(NSString*)dateFrom
                          dateTo:(NSString*)dateTo
                       withState:(NSString*)state
                        withType:(NSString*)transactionType
                      withCardId:(NSString*)cardId
                  withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion;

- (void) sendMoneyFromSender:(Sender*)sender
                  toReceiver:(Receiver*)receiver
                      amount:(NSString*)amount
                    currency:(NSString*)currency
                  expiryDate:(NSString*)expiryDate
                     comment:(NSString*)comment
            allowViewComment:(NSString*)allowViewComment
                       phone:(NSString*)phone
                       email:(NSString*)email
                withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion;

- (void) askMoneyFromSender:(MoneyAskSender*)sender
                 toReceiver:(MoneyAskReceiver*)receiver
                     amount:(NSString*)amount
                   currency:(NSString*)currency
                 expiryDate:(NSString*)expiryDate
                    comment:(NSString*)comment
           allowViewComment:(NSString*)allowViewComment
                      phone:(NSString*)phone
                      email:(NSString*)email
             withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion;

- (void) acceptMoneyAskingFromTransactionWithId:(NSString*)transactionId
                                     toReceiver:(Receiver*)receiver
                                        comment:(NSString*)comment
                               allowViewComment:(NSString*)allowViewComment
                                          phone:(NSString*)phone
                                          email:(NSString*)email
                                 withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion;

- (void)acceptMoneySendingFromSender:(Sender*)sender
                       transactionId:(NSString*)transactionId
                              amount:(NSString*)amount
                            currency:(NSString*)currency
                             comment:(NSString*)comment
                    allowViewComment:(NSString*)allowViewComment
                               phone:(NSString*)phone
                               email:(NSString*)email
                      withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion;

- (void)getFeeForAmount:(NSString*)amount
                 sender:(Sender*)sender
               receiver:(Receiver*)receiver
         withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion;
@end