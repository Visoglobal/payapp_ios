//
//  ContactConfirmFinAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "ToDo.h"

@interface ContactConfirmFinAnswer : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, retain)   ToDo* toDo;


@end

//<ContactConfirmFinRs>
//<RqId>str1234</RqId>
//<ServerDate>2012-12-13T12:12:12</ServerDate>
//<ToDo>
//<VerifyContact>str1234</VerifyContact>
//<ConfirmMoneySend>123</ConfirmMoneySend>
//<ConfirmMoneyReceive>123</ConfirmMoneyReceive>
//<HasTrNews>123</HasTrNews>
//</ToDo>
//</ContactConfirmFinRs>