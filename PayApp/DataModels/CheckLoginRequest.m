//
//  CheckLoginRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CheckLoginRequest.h"

@implementation CheckLoginRequest

-(NSString*)rootName
{
    return @"AppCheckLoginRq";
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