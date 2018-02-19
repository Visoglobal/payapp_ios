//
//  ContactConfirmFinRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface ContactConfirmFinRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;
@property (nonatomic, copy) NSString* verifyCode;

@end

//<ContactConfirmFinRq>
//<RqId>str1234</RqId>
//<LocalDate>2012-12-13T12:12:12</LocalDate>
//<SessionId>str1234</SessionId>
//<VerifyCode>str1234</VerifyCode>
//</ContactConfirmFinRq>