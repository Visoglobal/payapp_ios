//
//  CardRegisterRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CardRegisterRequest.h"

@implementation CardRegisterRequest

-(NSString*)rootName
{
    return @"CardRegisterRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"cardName",
                                                        @"cardPaySys",
                                                        @"pan",
                                                        @"expiryDate",
                                                        @"cardholderName",
                                                        @"cvc2",
                                                        @"creditDefault"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"CardName",
                                                                      @"CardPaySys",
                                                                      @"PAN",
                                                                      @"ExpiryDate",
                                                                      @"CardholderName",
                                                                      @"CVC2",
                                                                      @"CreditDefault"
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