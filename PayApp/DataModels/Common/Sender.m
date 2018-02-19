//
//  Sender.m
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "Sender.h"

@implementation Sender

-(NSString*)rootName
{
    return @"Sender";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"knownCard",
                                                        @"unknownCard"
                                                        ] forKeys:  @[
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
