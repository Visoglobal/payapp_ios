//
//  ClientInviteRequest.m
//  PayApp
//
//  Created by Alexey on 04.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ClientInviteRequest.h"

@implementation ClientInviteRequest

-(NSString*)rootName
{
    return @"ClientInviteRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"contact"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"Contact"
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
