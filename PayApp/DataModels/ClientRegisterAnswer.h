//
//  ClientRegisterAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "ToDo.h"
#import "LoginParams.h"

@interface ClientRegisterAnswer : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, retain)   ToDo* toDo;
@property (nonatomic, copy) NSString* sessionId;
@property (nonatomic, copy) NSString* contact;
@property (nonatomic, copy) NSString* expiryDate;
@property (nonatomic, retain)   LoginParams* loginParams;

@end

//<AppClientRegisterRs>
//<RqId>str1234</RqId>
//<ServerDate>2012-12-13T12:12:12</ServerDate>
//<ToDo>
//<VerifyContact>str1234</VerifyContact>
//<ConfirmMoneySend>123</ConfirmMoneySend>
//<ConfirmMoneyReceive>123</ConfirmMoneyReceive>
//<HasTrNews>123</HasTrNews>
//</ToDo>
//<SessionId>str1234</SessionId>
//<Contact>str1234</Contact>
//<VerifyExpiryDate>2012-12-13</VerifyExpiryDate>
//</AppClientRegisterRs>