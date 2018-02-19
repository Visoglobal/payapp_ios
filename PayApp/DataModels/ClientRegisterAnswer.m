//
//  ClientRegisterAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ClientRegisterAnswer.h"

@implementation ClientRegisterAnswer

-(NSString*)rootName
{
    return @"AppClientRegisterRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"sessionId",
                                                        @"toDo",
                                                        @"contact",
                                                        @"expiryDate",
                                                        @"loginParams"
                                                        ] forKeys:  @[
                                                                             @"RqId",
                                                                             @"ServerDate",
                                                                             @"SessionId",
                                                                             @"ToDo",
                                                                             @"Contact",
                                                                             @"VerifyExpiryDate",
                                                                             @"LoginParams"
                                                                             ]];
    
}


- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"ToDo": [ToDo class],
                                   @"LoginParams": [LoginParams class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}


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