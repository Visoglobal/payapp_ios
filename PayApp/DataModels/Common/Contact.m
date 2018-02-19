//
//  Contact.m
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "Contact.h"

@implementation Contact

-(BOOL)isVerified
{
    return (_verified && [_verified isEqualToString:@"true"])?YES:NO;
}

-(NSString*)rootName
{
    return @"Contact";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"phone",
                                                        @"email",
                                                        @"verified"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"Phone",
                                                                      @"Email",
                                                                      @"Verified"
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
