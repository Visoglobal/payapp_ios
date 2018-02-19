//
//  ClientViewRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ClientViewRequest.h"

@implementation ClientViewRequest

-(NSString*)rootName
{
    return @"ClientViewRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId"
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