//
//  Transaction.h
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"
#import "TransactionSender.h"
#import "TransactionReceiver.h"

typedef NS_ENUM(NSUInteger, TransactionStateMode) {
    TransactionStateModeNeedSender,
    TransactionStateModeNeedReceiver,
    TransactionStateModeVerify,
    TransactionStateModeDataNotReceived,
    TransactionStateModeInProgress,
    TransactionStateModeSuccess,
    TransactionStateModeFail,
    TransactionStateModeCantDetectState,
};

typedef NS_ENUM(NSUInteger, TransactionType) {
    TransactionTypeTransfer,
    TransactionTypeAsk,
};

@interface Transaction : BaseAnswerModel
{
    NSString* transactionTypeString;
}

@property (nonatomic, copy) NSString* transactionId;
@property (nonatomic, copy) NSString* transactionDate;
@property (nonatomic, copy) NSString* transactionUpdateDate;
@property (nonatomic, copy) NSString* transactionState;
@property (nonatomic, assign) TransactionStateMode transactionStateMode;
@property (nonatomic, copy) NSString* expiryDate;
@property (nonatomic, copy) NSString* isNew;
@property (nonatomic, copy) NSString* resultCode;
@property (nonatomic, copy) NSString* phone;
@property (nonatomic, copy) NSString* email;
@property (nonatomic, retain) TransactionSender* sender;
@property (nonatomic, retain) TransactionReceiver* receiver;
@property (nonatomic, assign) TransactionType transactionType;


@property (nonatomic, assign) NSString* transactionSum;
@property (nonatomic, assign) NSString* transactionCurrency;
@property (nonatomic, assign) NSString* transactionFee;
@property (nonatomic, assign) NSString* transactionShortDate;
@end