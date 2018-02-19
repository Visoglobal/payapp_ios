//
//  ApplyTransaction.m
//  PayApp
//
//  Created by Alexey on 14.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ApplyTransaction.h"

@implementation ApplyTransaction

- (id)initWithTransaction:(Transaction*)transaction
{
    self = [super init];
    if (self)
    {
        self.transactionId = transaction.transactionId;
        
        self.transactionStateMode = transaction.transactionStateMode;
        self.transactionUser = [TransactionClient new];
        
        if (transaction.sender){
            if (transaction.sender.client)
                self.transactionUser.client = transaction.sender.client;
            else
                if (transaction.sender.own)
                    self.transactionUser.own = transaction.sender.own;
        }
        if (transaction.receiver){
            if (transaction.receiver.client)
                self.transactionUser.client = transaction.receiver.client;
            else
                if (transaction.receiver.own)
                    self.transactionUser.own = transaction.receiver.own;
        }
        
        if(transaction.transactionStateMode == TransactionStateModeNeedSender)
            if (transaction.sender.own)
                self.transactionUser.own = transaction.sender.own;
        if(transaction.transactionStateMode == TransactionStateModeNeedReceiver)
            if (transaction.receiver.own)
                self.transactionUser.own = transaction.receiver.own;
    }
    return self;
}

@end

