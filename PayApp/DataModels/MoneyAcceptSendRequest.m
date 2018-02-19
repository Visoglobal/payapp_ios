//
//  MoneyAcceptSendRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "MoneyAcceptSendRequest.h"

@implementation MoneyAcceptSendRequest

-(NSString*)rootName
{
    return @"MoneyAcceptSendRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"transactionId",
                                                        @"sender",
                                                        @"amount",
                                                        @"currency",
                                                        @"comment",
                                                        @"allowViewComment",
                                                        @"phone",
                                                        @"email"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"TrId",
                                                                      @"Sender",
                                                                      @"Amount",
                                                                      @"Currency",
                                                                      @"Comment",
                                                                      @"AllowViewComment",
                                                                      @"Phone",
                                                                      @"Email"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"Sender": [Sender class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}

@end