//
//  LoginRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "LoginRequest.h"


@implementation LoginRequest

-(NSString*)rootName
{
    return @"AppLoginRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
     return [CHOrderedDictionary dictionaryWithObjects:@[
                                                         @"requestId",
                                                         @"localDate",
                                                         @"login",
                                                         @"password",
                                                         @"device"
                                                         ] forKeys:  @[
                                                                                   @"RqId",
                                                                                   @"LocalDate",
                                                                                   @"Login",
                                                                                   @"Passwd",
                                                                                   @"Device"
                                                                       ]];

}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"Device": [Device class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}

@end


//<AppLoginRq>
//<RqId>str1234</RqId>
//<LocalDate>2012-12-13T12:12:12</LocalDate>
//<Login>str1234</Login>
//<Passwd>str1234</Passwd>
//</AppLoginRq>