//
//  Transaction.m
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction


- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"transactionId",
                                                        @"transactionDate",
                                                        @"transactionUpdateDate",
                                                        @"transactionState",
                                                        @"isNew",
                                                        @"expiryDate",
                                                        @"resultCode",
                                                        @"phone",
                                                        @"email",
                                                        @"sender",
                                                        @"receiver",
                                                        @"transactionTypeString"
                                                        ] forKeys:  @[
                                                                      @"TrId",
                                                                      @"TrDate",
                                                                      @"TrUpdateDate",
                                                                      @"TrState",
                                                                      @"IsNew",
                                                                      @"ExpiryDate",
                                                                      @"ResultCode",
                                                                      @"Phone",
                                                                      @"Email",
                                                                      @"Sender",
                                                                      @"Receiver",
                                                                      @"TrType"
                                                                      ]];
    
}

-(NSString*)transactionShortDate
{
    if (!_transactionDate)
        return @"";

    NSString* newTime = [_transactionDate stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZZZZZ"];
    NSDate* transDate = [format dateFromString:newTime];
    
    if (!transDate)
        return @"";
    
    [format setDateFormat:@"dd.MM.yyyy"];
    NSString* formattedDateSrt = [format stringFromDate:transDate];
        
   return formattedDateSrt? formattedDateSrt:@"";

}

-(NSString*)transactionSum
{
    NSString* sum = nil;
    if (_sender&&  _sender.own && _sender.own.amount)
        sum = _sender.own.amount;

    if (!sum && _receiver&&  _receiver.own && _receiver.own.amount)
        sum = _receiver.own.amount;
    
    return sum?sum:@"";
}

-(NSString*)transactionCurrency
{
    NSString* currency = nil;
    if (_sender&&  _sender.own && _sender.own.currency)
        currency = _sender.own.currency;
    
    if (!currency && _receiver&&  _receiver.own && _receiver.own.currency)
        currency = _receiver.own.currency;
    
    return currency?currency:@"";
}

-(NSString*)transactionFee
{
    NSString* fee = nil;
    if (_sender&&  _sender.own && _sender.own.feeAmount)
        fee = _sender.own.feeAmount;
    if (!fee && _receiver&&  _receiver.own && _receiver.own.feeAmount)
        fee = _receiver.own.feeAmount;
    
    if (self.transactionType == TransactionTypeTransfer && _sender&&  _sender.own && _sender.own.feeAmount && _receiver&&  _receiver.own && _receiver.own.feeAmount)
        fee = _sender.own.feeAmount;
    
    return fee?fee:@"";
}

-(TransactionType)transactionType
{
    if (transactionTypeString && [transactionTypeString isEqualToString:@"transfer"]) {
        return TransactionTypeTransfer;
    }
    
    return TransactionTypeAsk;
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"Sender": [TransactionSender class],
                                   @"Receiver": [TransactionReceiver class]
                                   };
}

-(NSString*)rootName
{
    return @"Transaction";
}

-(TransactionStateMode)transactionStateMode
{
    NSInteger item = -1;
    NSArray *states = @[@"needsender", @"needreceiver", @"verify", @"datanotreceived", @"inprogress", @"success", @"fail"];
    if (_transactionState)
      item = [states indexOfObject:_transactionState];
    
    switch (item) {
        case 0:
            return TransactionStateModeNeedSender;
            break;
        case 1:
            return TransactionStateModeNeedReceiver;
            break;
        case 2:
            return TransactionStateModeVerify;
            break;
        case 3:
            return TransactionStateModeDataNotReceived;
            break;
        case 4:
            return TransactionStateModeInProgress;
            break;
        case 5:
            return TransactionStateModeSuccess;
            break;
        case 6:
            return TransactionStateModeFail;
            break;
            
        default:
            return TransactionStateModeCantDetectState;
            break;
    }

}

@end
