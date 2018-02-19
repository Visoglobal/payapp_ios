//
//  TransactionDetail.m
//  PayApp
//
//  Created by Alexey on 08.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "TransactionDetail.h"
#import "UserManager.h"

@implementation TransactionDetail

- (id)initWithTransaction:(Transaction*)transaction
{
    self = [super init];
    if (self)
    {
        if (transaction.sender){
            if (transaction.sender.client)
            {
                self.senderFullName = [NSString stringWithFormat:@"%@ %@", transaction.sender.client.name?transaction.sender.client.name:@"", transaction.sender.client.familyName?transaction.sender.client.familyName:@""];
            }else{
                self.senderFullName =[NSString stringWithFormat:@"%@ %@", USER_MANAGER.contact.firstName, USER_MANAGER.contact.secondName];
                self.transactionAmount = transaction.sender.own.amount;
                self.transactionFee = transaction.sender.own.feeAmount;
                self.transactionCurrency = transaction.sender.own.currency;
                self.senderCardNum = transaction.sender.own.maskedPAN;
            }
        }
        if (transaction.receiver){
            if (transaction.receiver.client)
            {
                self.receiverFullName = [NSString stringWithFormat:@"%@ %@", transaction.receiver.client.name?transaction.receiver.client.name:@"", transaction.receiver.client.familyName?transaction.receiver.client.familyName:@""];
            }else{
                self.receiverFullName =[NSString stringWithFormat:@"%@ %@", USER_MANAGER.contact.firstName, USER_MANAGER.contact.secondName];
                self.transactionAmount = transaction.receiver.own.amount;
                self.transactionFee = transaction.receiver.own.feeAmount;
                self.transactionCurrency = transaction.receiver.own.currency;
                self.receiverCardNum = transaction.receiver.own.maskedPAN;
            }
        }

    }
    return self;
}

@end
