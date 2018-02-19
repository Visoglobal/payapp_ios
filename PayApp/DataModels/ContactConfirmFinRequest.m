//
//  ContactConfirmFinRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ContactConfirmFinRequest.h"

@implementation ContactConfirmFinRequest

-(NSString*)rootName
{
    return @"ContactConfirmFinRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"verifyCode"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"VerifyCode"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{};
}

-(NSArray*) attributes
{
    return nil;
}


@end

//<ContactConfirmFinRq>
//<RqId>str1234</RqId>
//<LocalDate>2012-12-13T12:12:12</LocalDate>
//<SessionId>str1234</SessionId>
//<VerifyCode>str1234</VerifyCode>
//</ContactConfirmFinRq>