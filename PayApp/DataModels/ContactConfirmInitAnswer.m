//
//  ContactConfirmInitAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ContactConfirmInitAnswer.h"

@implementation ContactConfirmInitAnswer

-(NSString*)rootName
{
    return @"AppContactConfirmInitRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"contact",
                                                        @"verifyExpiryDate"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"Contact",
                                                                      @"VerifyExpiryDate"
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

//<AppContactConfirmInitRs>
//<Version>1</Version>
//<RqId>str1234</RqId>
//<ServerDate>2012-12-13T12:12:12</ServerDate>
//<Contact>str1234</Contact>
//<VerifyExpiryDate>2012-12-13</VerifyExpiryDate>
//</AppContactConfirmInitRs>