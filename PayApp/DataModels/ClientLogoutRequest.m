//
//  ClientLogoutRequest.m
//  PayApp
//
//  Created by Alexey on 12.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "ClientLogoutRequest.h"

@implementation ClientLogoutRequest : BaseRequestModel

-(NSString*)rootName
{
    return @"ClientLogoutRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId"] forKeys:  @[
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

