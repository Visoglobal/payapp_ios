//
//  MoneyAcceptReceiveRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "MoneyAcceptReceiveRequest.h"

@implementation MoneyAcceptReceiveRequest

-(NSString*)rootName
{
    return @"MoneyAcceptReceiveRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"transactionId",
                                                        @"receiver",
                                                        @"comment",
                                                        @"allowViewComment",
                                                        @"phone",
                                                        @"email"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"TrId",
                                                                      @"Receiver",
                                                                      @"Comment",
                                                                      @"AllowViewComment",
                                                                      @"Phone",
                                                                      @"Email"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"Receiver": [Receiver class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}

@end