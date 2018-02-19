//
//  ClientEditAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ClientEditAnswer.h"

@implementation ClientEditAnswer

-(NSString*)rootName
{
    return @"ClientEditRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"toDo"] forKeys:  @[
                                                                             @"RqId",
                                                                             @"ServerDate",
                                                                             @"ToDo"
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