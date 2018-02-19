//
//  TransactionListRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "TransactionListRequest.h"

@implementation TransactionListRequest

-(NSString*)rootName
{
    return @"TransactionListRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"page",
                                                        @"transactionId",
                                                        @"dateFrom",
                                                        @"dateTo",
                                                        @"cardId",
                                                        @"transactionState",
                                                        @"transactionType",
                                                        @"isNew",
                                                        @"phone",
                                                        @"email"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"Page",
                                                                      @"TrId",
                                                                      @"DateFrom",
                                                                      @"DateTo",
                                                                      @"CardId",
                                                                      @"TrState",
                                                                      @"TrType",
                                                                      @"IsNew",
                                                                      @"Phone",
                                                                      @"Email"
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