//
//  MoneySendAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "MoneySendAnswer.h"

@implementation MoneySendAnswer

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
                                                        @"expiryDate",
                                                        @"verify"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"ServerDate",
                                                                      @"ToDo",                                                                      
                                                                      @"TrId",
                                                                      @"TrState",
                                                                      @"ExpiryDate",
                                                                      @"Verify"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"ToDo": [ToDo class],
                                   @"Verify": [Verify class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}

@end
