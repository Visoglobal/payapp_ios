//
//  LoginAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "LoginAnswer.h"

@implementation LoginAnswer

-(NSString*)rootName
{
    return @"AppLoginRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"sessionId",
                                                        @"toDo",
                                                        @"loginParams"
                                                        ] forKeys:  @[
                                                                                 @"RqId",
                                                                                 @"ServerDate",
                                                                                 @"SessionId",
                                                                                 @"ToDo",
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

//<AppLoginRs>
//<Version>1</Version>
//<RqId>str1234</RqId>
//<ServerDate>2012-12-13T12:12:12</ServerDate>
//<ToDo>
//<VerifyContact>str1234</VerifyContact>
//<ConfirmMoneySend>123</ConfirmMoneySend>
//<ConfirmMoneyReceive>123</ConfirmMoneyReceive>
//<HasTrNews>123</HasTrNews>
//</ToDo>
//<SessionId>str1234</SessionId>
//</AppLoginRs>

//RqId = 1;
//ServerDate = "2015-10-26T14:38:34.005+03:00";
//SessionId = fS5EJ9pQsWpd;
//ToDo =     {
//    AllowFinance = false;
//    VerifyContact = "testmail2@mail.ru";
//};