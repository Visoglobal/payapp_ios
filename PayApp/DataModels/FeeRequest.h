//
//  WebFeeRequest.h
//  PayApp
//
//  Created by Alexey on 20.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "SenderInfo.h"
#import "ReceiverInfo.h"

@interface FeeRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;

@property (nonatomic, retain) SenderInfo*   senderInfo;
@property (nonatomic, retain) ReceiverInfo* receiverInfo;

@property (nonatomic, copy) NSString* amount;

@end
