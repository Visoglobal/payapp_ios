//
//  MoneyAskAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "MoneyAskAnswer.h"

@implementation MoneyAskAnswer

-(NSString*)rootName
{
    return @"MoneySendRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"toDo",
                                                        @"transactionId",
                                                        @"transactionState",
                                                        @"expiryDate"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"ServerDate",
                                                                      @"ToDo",                                                                      
                                                                      @"TrId",
                                                                      @"TrState",
                                                                      @"ExpiryDate"
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