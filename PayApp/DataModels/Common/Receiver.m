//
//  Receiver.m
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "Receiver.h"

@implementation Receiver

-(NSString*)rootName
{
    return @"Receiver";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"clientId",
                                                        @"contact",
                                                        @"knownCard",
                                                        @"unknownCard"
                                                        ] forKeys:  @[
                                                                      @"ClientId",
                                                                      @"Contact",
                                                                      @"KnownCard",
                                                                      @"NewCard"
                                                                      ]];
    
}


- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"KnownCard": [KnownCard class],
                                   @"NewCard": [NewCard class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}


@end
