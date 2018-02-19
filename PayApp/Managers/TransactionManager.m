//
//  TransactionManager.m
//  PayApp
//
//  Created by Alexey on 10.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "TransactionManager.h"

#import "UserManager.h"
#import "TransactionListRequest.h"
#import "TransactionListAnswer.h"
#import "MoneySendRequest.h"
#import "MoneySendAnswer.h"
#import "MoneyAskRequest.h"
#import "MoneyAskAnswer.h"
#import "MoneyAcceptReceiveRequest.h"
#import "MoneyAcceptReceiveAnswer.h"
#import "MoneyAcceptSendAnswer.h"
#import "MoneyAcceptSendRequest.h"
#import "FeeRequest.h"
#import "FeeAnswer.h"

@implementation TransactionManager

+ (instancetype) sharedTransactionManager
{
    static TransactionManager * _sharedTransactionManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedTransactionManager = [[TransactionManager alloc] init];
    });
    
    return _sharedTransactionManager;
}

- (void) getTransactionsFromPage:(NSString*)pageNum
                        dateFrom:(NSString*)dateFrom
                          dateTo:(NSString*)dateTo
                       withState:(NSString*)state
                        withType:(NSString*)transactionType
                      withCardId:(NSString*)cardId
                  withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion
{
    TransactionListRequest* transactiosRqst = [TransactionListRequest new];
    transactiosRqst.requestId = @"1";
    transactiosRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    transactiosRqst.sessionId = USER_MANAGER.sessionId;
    transactiosRqst.page = pageNum;
    transactiosRqst.dateFrom = dateFrom;
    transactiosRqst.dateTo = dateTo;
    transactiosRqst.transactionState = state;
    transactiosRqst.transactionType = transactionType;
    transactiosRqst.cardId = cardId;
    
    [requestManager sendRequest:transactiosRqst complete:^(id responseObject, NSError *error) {
        TransactionListAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[TransactionListAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
        }
        
        if (completion)
            completion(answer, error);
    }];
}

- (void) sendMoneyFromSender:(Sender*)sender
                  toReceiver:(Receiver*)receiver
                      amount:(NSString*)amount
                    currency:(NSString*)currency
                  expiryDate:(NSString*)expiryDate
                     comment:(NSString*)comment
            allowViewComment:(NSString*)allowViewComment
                       phone:(NSString*)phone
                       email:(NSString*)email
                  withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion
{
    MoneySendRequest* transactiosRqst = [MoneySendRequest new];
    transactiosRqst.requestId = @"1";
    transactiosRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    transactiosRqst.sessionId = USER_MANAGER.sessionId;
    transactiosRqst.sender = sender;
    transactiosRqst.receiver = receiver;
    transactiosRqst.amount = amount;
    transactiosRqst.currency = currency;
    transactiosRqst.expiryDate = expiryDate;
    transactiosRqst.comment = comment;
    transactiosRqst.allowViewComment = allowViewComment;
    transactiosRqst.phone = phone;
    transactiosRqst.email = email;
    
    [requestManager sendRequest:transactiosRqst complete:^(id responseObject, NSError *error) {
        MoneySendAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[MoneySendAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
        }
        
        if (completion)
            completion(answer, error);
    }];
}


- (void) askMoneyFromSender:(MoneyAskSender*)sender
                  toReceiver:(MoneyAskReceiver*)receiver
                      amount:(NSString*)amount
                    currency:(NSString*)currency
                  expiryDate:(NSString*)expiryDate
                     comment:(NSString*)comment
            allowViewComment:(NSString*)allowViewComment
                       phone:(NSString*)phone
                       email:(NSString*)email
              withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion
{
    MoneyAskRequest* transactiosRqst = [MoneyAskRequest new];
    transactiosRqst.requestId = @"1";
    transactiosRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    transactiosRqst.sessionId = USER_MANAGER.sessionId;
    transactiosRqst.sender = sender;
    transactiosRqst.receiver = receiver;
    transactiosRqst.amount = amount;
    transactiosRqst.currency = currency;
    transactiosRqst.expiryDate = expiryDate;
    transactiosRqst.comment = comment;
    transactiosRqst.allowViewComment = allowViewComment;
    transactiosRqst.phone = phone;
    transactiosRqst.email = email;
    
    [requestManager sendRequest:transactiosRqst complete:^(id responseObject, NSError *error) {
        MoneyAskAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[MoneyAskAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
        }
        
        if (completion)
            completion(answer, error);
    }];
}

-(void)acceptMoneyAskingFromTransactionWithId:(NSString*)transactionId
                                   toReceiver:(Receiver*)receiver
                                      comment:(NSString*)comment
                             allowViewComment:(NSString*)allowViewComment
                                        phone:(NSString*)phone
                                        email:(NSString*)email
                               withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion
{
    //<xs:documentation>Подтверждение желания получить денежные средства</xs:documentation>
    MoneyAcceptReceiveRequest* transactiosRqst = [MoneyAcceptReceiveRequest new];
    transactiosRqst.requestId = @"1";
    transactiosRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    transactiosRqst.sessionId = USER_MANAGER.sessionId;
    transactiosRqst.transactionId = transactionId;
    transactiosRqst.receiver = receiver;
    transactiosRqst.comment = comment;
    transactiosRqst.allowViewComment = allowViewComment;
    transactiosRqst.phone = phone;
    transactiosRqst.email = email;
    
    [requestManager sendRequest:transactiosRqst complete:^(id responseObject, NSError *error) {
        MoneyAcceptReceiveAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[MoneyAcceptReceiveAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
        }
        
        if (completion)
            completion(answer, error);
    }];
}

- (void)acceptMoneySendingFromSender:(Sender*)sender
              transactionId:(NSString*)transactionId
                     amount:(NSString*)amount
                   currency:(NSString*)currency
                    comment:(NSString*)comment
           allowViewComment:(NSString*)allowViewComment
                      phone:(NSString*)phone
                      email:(NSString*)email
             withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion
{
//    <xs:documentation>Подтверждение подтверждения желания отправить денежные средства</xs:documentation>
//    Запрос предназначен для завершения клиентом-отправителем операции перевода средств в случае, когда транзакция находится в состоянии needsender (требуются данные карты отправителя). Транзакция была первоначально инициирована получателем с помощью запроса MoneyAsk.
    
    MoneyAcceptSendRequest* transactiosRqst = [MoneyAcceptSendRequest new];
    transactiosRqst.requestId = @"1";
    transactiosRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    transactiosRqst.sessionId = USER_MANAGER.sessionId;
    transactiosRqst.sender = sender;
    transactiosRqst.amount = amount;
    transactiosRqst.currency = currency;
    transactiosRqst.comment = comment;
    transactiosRqst.allowViewComment = allowViewComment;
    transactiosRqst.phone = phone;
    transactiosRqst.email = email;
    transactiosRqst.transactionId = transactionId;
    
    [requestManager sendRequest:transactiosRqst complete:^(id responseObject, NSError *error) {
        MoneyAcceptSendAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[MoneyAcceptSendAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
        }
        
        if (completion)
            completion(answer, error);
    }];
}

- (void)getFeeForAmount:(NSString*)amount
                 sender:(Sender*)sender
               receiver:(Receiver*)receiver
         withCompletion:(void (^)(id transactionAnswer,  NSError *error))completion
{
    
    FeeRequest* transactiosRqst = [FeeRequest new];
    transactiosRqst.requestId = @"1";
    transactiosRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    transactiosRqst.sessionId = USER_MANAGER.sessionId;
    
    ReceiverInfo* recInfo = [ReceiverInfo new];
    recInfo.clientId = receiver.clientId;
    recInfo.contact = receiver.contact;
    SenderInfo* sendInfo = [SenderInfo new];
    sendInfo.cardId  = sender.knownCard.cardId;
    sendInfo.pan  = sender.knownCard.pan;
    
    transactiosRqst.senderInfo = sendInfo;
    transactiosRqst.amount = amount;
    transactiosRqst.receiverInfo = recInfo;
    
    [requestManager sendRequest:transactiosRqst complete:^(id responseObject, NSError *error) {
        FeeAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[FeeAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
        }
        
        if (completion)
            completion(answer, error);
    }];
}

@end