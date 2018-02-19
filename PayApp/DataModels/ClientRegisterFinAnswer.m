//
//  ClientRegisterFinAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ClientRegisterFinAnswer.h"

@implementation ClientRegisterFinAnswer


-(NSString*)rootName
{
    return @"AppClientRegisterFinRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"toDo",
                                                        @"sessionId"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"ServerDate",
                                                                      @"ToDo",
                                                                      @"SessionId"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"ToDo": [ToDo class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}



@end

//<AppClientRegisterFinRs>
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
//</AppClientRegisterFinRs>