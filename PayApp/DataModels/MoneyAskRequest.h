//
//  MoneyAskRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseRequestModel.h"
#import "MoneyAskSender.h"
#import "MoneyAskReceiver.h"

@interface MoneyAskRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;

@property (nonatomic, retain) MoneyAskReceiver*   receiver;
@property (nonatomic, retain) MoneyAskSender*   sender;

@property (nonatomic, copy) NSString* amount;
@property (nonatomic, copy) NSString* currency;
@property (nonatomic, copy) NSString* expiryDate;
@property (nonatomic, copy) NSString* comment;
@property (nonatomic, copy) NSString* allowViewComment;
@property (nonatomic, copy) NSString* phone;
@property (nonatomic, copy) NSString* email;

@end
