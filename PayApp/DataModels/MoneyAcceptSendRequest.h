//
//  MoneyAcceptSendRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "Sender.h"

@interface MoneyAcceptSendRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;

@property (nonatomic, copy) NSString* transactionId;

@property (nonatomic, retain) Sender* sender;

@property (nonatomic, copy) NSString* amount;
@property (nonatomic, copy) NSString* currency;
@property (nonatomic, copy) NSString* comment;
@property (nonatomic, copy) NSString* allowViewComment;
@property (nonatomic, copy) NSString* phone;
@property (nonatomic, copy) NSString* email;

@end
