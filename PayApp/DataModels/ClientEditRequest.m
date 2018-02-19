//
//  ClientEditRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ClientEditRequest.h"

@implementation ClientEditRequest

-(NSString*)rootName
{
    return @"ClientEditRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"familyName",
                                                        @"name",
                                                        @"parentName",
                                                        @"birthDate",
                                                        @"sex",
                                                        @"allowProfileView",
                                                        @"base64imageString",
                                                        @"device"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"FamilyName",
                                                                      @"Name",
                                                                      @"ParentName",
                                                                      @"BirthDate",
                                                                      @"Sex",
                                                                      @"AllowProfileView",
                                                                      @"Image",
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
