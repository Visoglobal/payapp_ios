//
//  ContactConfirmInitRequest.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ContactConfirmInitRequest.h"

@implementation ContactConfirmInitRequest

-(NSString*)rootName
{
    return @"AppContactConfirmInitRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"contact"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"Contact"
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

//<AppContactConfirmInitRq>
//<Version>1</Version>
//<RqId>str1234</RqId>
//<LocalDate>2012-12-13T12:12:12</LocalDate>
//<Contact>str1234</Contact>
//</AppContactConfirmInitRq>