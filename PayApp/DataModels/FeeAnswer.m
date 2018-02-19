//
//  WebFeeAnswer.m
//  PayApp
//
//  Created by Alexey on 20.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "FeeAnswer.h"

@implementation FeeAnswer


-(NSString*)rootName
{
    return @"FeeRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"feeAmount"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"ServerDate",
                                                                      @"FeeAmount"
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
