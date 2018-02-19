//
//  ApplyTransaction.h
//  PayApp
//
//  Created by Alexey on 14.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"
#import "TransactionClient.h"

@interface ApplyTransaction : NSObject

@property (nonatomic, assign) TransactionStateMode transactionStateMode;
@property (nonatomic, retain) TransactionClient*   transactionUser;
@property (nonatomic, copy)   NSString*            transactionId;

- (id)initWithTransaction:(Transaction*)transaction;

@end
