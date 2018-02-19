//
//  MoneySendRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "MoneySendRequest.h"

@implementation MoneySendRequest

-(NSString*)rootName
{
    return @"MoneySendRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                         @"requestId",
                                                         @"localDate",
                                                         @"sessionId",
                                                         @"sender",
                                                         @"receiver",
                                                         @"amount",
                                                         @"currency",
                                                         @"expiryDate",
                                                         @"comment",
                                                         @"allowViewComment",
                                                         @"phone",
                                                         @"email"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"Sender",
                                                                      @"Receiver",
                                                                      @"Amount",
                                                                      @"Currency",
                                                                      @"ExpiryDate",
                                                                      @"Comment",
                                                                      @"AllowViewComment",
                                                                      @"Phone",
                                                                      @"Email"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"Sender": [Sender class],
                                   @"Receiver": [Receiver class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}

@end


