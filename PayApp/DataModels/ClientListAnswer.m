//
//  ClientListAnswer.m
//  PayApp
//
//  Created by Alexey on 18.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ClientListAnswer.h"

@implementation ClientListAnswer

-(NSString*)rootName
{
    return @"ClientListRs";
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"ToDo": [ToDo class],
                                   @"ClientList": [ClientList class]
                                   };
}


- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"toDo",
                                                        @"clientList"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"ServerDate",
                                                                      @"ToDo",
                                                                      @"ClientList"
                                                                      ]];
    
}



-(NSArray*) attributes
{
    return nil;
}

@end
