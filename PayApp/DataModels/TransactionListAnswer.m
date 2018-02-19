//
//  TransactionListAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "TransactionListAnswer.h"

@implementation TransactionListAnswer


-(NSString*)rootName
{
    return @"TransactionListRs";
}

- (CHOrderedDictionary *)mapClasses
{
        return (CHOrderedDictionary*)@{
                    @"ToDo": [ToDo class],
                    @"TransactionList": [TransactionList class]
                 };
}


- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"toDo",
                                                        @"transactionList"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"ServerDate",
                                                                      @"ToDo",
                                                                      @"TransactionList"
                                                                      ]];
    
}



-(NSArray*) attributes
{
    return nil;
}

@end
