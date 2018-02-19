//
//  RestorePasswdRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "RestorePasswdRequest.h"

@implementation RestorePasswdRequest

-(NSString*)rootName
{
    return @"AppRestorePasswdRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"login"] forKeys: @[
                                                                             @"RqId",
                                                                             @"LocalDate",
                                                                             @"Login",
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

//<AppRestorePasswdRq>
//<RqId>str1234</RqId>
//<LocalDate>2012-12-13T12:12:12</LocalDate>
//<Login>str1234</Login>
//</AppRestorePasswdRq>