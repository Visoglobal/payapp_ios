//
//  ClientRegisterRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ClientRegisterRequest.h"

@implementation ClientRegisterRequest


-(NSString*)rootName
{
    return @"AppClientRegisterRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"login",
                                                        @"password",
                                                        @"familyName",
                                                        @"name",
                                                        @"parentName",
                                                        @"birthDate",
                                                        @"sex",
                                                        @"allowProfileView",
                                                        @"device"
                                                        ] forKeys:  @[
                                                                                 @"RqId",
                                                                                 @"LocalDate",
                                                                                 @"Login",
                                                                                 @"Passwd",
                                                                                 @"FamilyName",
                                                                                 @"Name",
                                                                                 @"ParentName",
                                                                                 @"BirthDate",
                                                                                 @"Sex",
                                                                                 @"AllowProfileView",
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

//<AppClientRegisterRq>
//<Version>1</Version>
//<RqId>str1234</RqId>
//<LocalDate>2012-12-13T12:12:12</LocalDate>
//<Login>str1234</Login>
//<Passwd>str1234</Passwd>
//<FamilyName>str1234</FamilyName>
//<Name>str1234</Name>
//<ParentName>str1234</ParentName>
//<BirthDate>2012-12-13</BirthDate>
//<Sex>male</Sex>
//<AllowProfileView>true</AllowProfileView>
//</AppClientRegisterRq>