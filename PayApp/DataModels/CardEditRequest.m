//
//  CardEditRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CardEditRequest.h"

@implementation CardEditRequest

-(NSString*)rootName
{
    return @"CardEditRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",                                                        
                                                        @"cardId",
                                                        @"cardName",
                                                        @"cardState",
                                                        @"creditDefault",
                                                        @"expiryDate",
                                                        @"cardholderName",
                                                        @"cvc2"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",                                                                      
                                                                      @"CardId",
                                                                      @"CardName",
                                                                      @"CardState",
                                                                      @"CreditDefault",
                                                                      @"ExpiryDate",
                                                                      @"CardholderName",
                                                                      @"CVC2"
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