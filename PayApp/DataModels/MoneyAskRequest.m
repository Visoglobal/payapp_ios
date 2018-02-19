//
//  MoneyAskRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "MoneyAskRequest.h"

@implementation MoneyAskRequest

-(NSString*)rootName
{
    return @"MoneyAskRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"receiver",
                                                        @"sender",
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
                                                                      @"Receiver",
                                                                      @"Sender",
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
                                   @"Receiver": [MoneyAskReceiver class],
                                   @"Sender": [MoneyAskSender class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}



@end
