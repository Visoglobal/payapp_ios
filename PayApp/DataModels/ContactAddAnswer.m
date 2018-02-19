//
//  ContactAddAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ContactAddAnswer.h"

@implementation ContactAddAnswer

-(NSString*)rootName
{
    return @"ContactAddRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"toDo",
                                                        @"verifyExpiryDate"
                                                        ] forKeys:  @[
                                                                      @"RequestId",
                                                                      @"ServerDate",
                                                                      @"ToDo",
                                                                      @"VerifyExpiryDate",
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