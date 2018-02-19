//
//  ClientListRequest.m
//  PayApp
//
//  Created by Alexey on 18.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ClientListRequest.h"

@implementation ClientListRequest

-(NSString*)rootName
{
    return @"ClientListRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"clientListConstruct"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"ContactList"
                                                                      ]];
    
}

-(NSString*)clientListConstruct
{
    if (!_contactList || _contactList.count ==0)
        return nil;
    NSString* namespaceShort = @"ns";
    NSString* parameterName  = @"Contact";
    
    NSMutableString* constructedString = [NSMutableString string];

    for (NSString* contact in _contactList) {
        [constructedString appendString:[NSString stringWithFormat:@"<%@:%@>",namespaceShort,parameterName]];
        [constructedString appendString:contact];
        [constructedString appendString:[NSString stringWithFormat:@"</%@:%@>",namespaceShort,parameterName]];
    }
    
    return constructedString;
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
