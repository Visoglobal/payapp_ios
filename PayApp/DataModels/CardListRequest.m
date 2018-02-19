//
//  CardListRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CardListRequest.h"

@implementation CardListRequest

-(NSString*)rootName
{
    return @"CardListRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"page",
                                                        @"cardId",
                                                        @"cardState"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"Page",
                                                                      @"CardId",
                                                                      @"CardState"
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
