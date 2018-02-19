//
//  CardRegisterAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CardRegisterAnswer.h"

@implementation CardRegisterAnswer

-(NSString*)rootName
{
    return @"CardRegisterRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"toDo",
                                                        @"cardId",
                                                        @"cardName",
                                                        @"cardState",
                                                        @"cardFill"
                                                        ] forKeys:  @[
                                                                      @"RequestId",
                                                                      @"ServerDate",
                                                                      @"ToDo",                                                                      
                                                                      @"CardId",
                                                                      @"CardName",
                                                                      @"CardState",
                                                                      @"CardFill"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"ToDo": [ToDo class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}

@end
