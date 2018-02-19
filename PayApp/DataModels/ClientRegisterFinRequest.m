//
//  ClientRegisterFinRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ClientRegisterFinRequest.h"

@implementation ClientRegisterFinRequest

-(NSString*)rootName
{
    return @"AppClientRegisterFinRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"login",
                                                        @"password",
                                                        @"verifyCode",
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
                                                                      @"VerifyCode",
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
