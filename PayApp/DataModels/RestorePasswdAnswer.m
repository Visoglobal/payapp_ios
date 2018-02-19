//
//  RestorePasswdAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "RestorePasswdAnswer.h"

@implementation RestorePasswdAnswer

-(NSString*)rootName
{
    return @"AppRestorePasswdRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate"
                                                        ] forKeys:  @[
                                                                     @"RqId",
                                                                     @"ServerDate"
                                                                     ]];
    
}


- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{};
}


@end

//<AppRestorePasswdRs>
//<RqId>str1234</RqId>
//<ServerDate>2012-12-13T12:12:12</ServerDate>
//</AppRestorePasswdRs>