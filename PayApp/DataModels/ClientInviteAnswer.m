//
//  ClientInviteAnswer.m
//  PayApp
//
//  Created by Alexey on 04.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ClientInviteAnswer.h"

@implementation ClientInviteAnswer

-(NSString*)rootName
{
    return @"ClientInviteRs";
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
