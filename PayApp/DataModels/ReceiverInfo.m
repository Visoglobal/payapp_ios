//
//  ReceiverInfo.m
//  PayApp
//
//  Created by Alexey on 23.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ReceiverInfo.h"

@implementation ReceiverInfo

-(NSString*)rootName
{
    return @"ReceiverInfo";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"clientId",
                                                        @"contact"
                                                        ] forKeys:  @[
                                                                      @"ClientId",
                                                                      @"Contact"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{ };
}

-(NSArray*) attributes
{
    return nil;
}
@end
