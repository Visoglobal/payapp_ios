//
//  TransactionDetail.h
//  PayApp
//
//  Created by Alexey on 08.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"

@interface TransactionDetail : NSObject

@property (nonatomic, copy) NSString* senderFullName;
@property (nonatomic, copy) NSString* senderCardNum;
@property (nonatomic, copy) NSString* receiverFullName;
@property (nonatomic, copy) NSString* receiverCardNum;
@property (nonatomic, copy) NSString* transactionAmount;
@property (nonatomic, copy) NSString* transactionFee;
@property (nonatomic, copy) NSString* transactionCurrency;

- (id)initWithTransaction:(Transaction*)transaction;

@end
