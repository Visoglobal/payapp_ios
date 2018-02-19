//
//  Verify.m
//  PayApp
//
//  Created by Alexey on 04.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "Verify.h"

@implementation Verify


-(NSString*)rootName
{
    return @"Verify";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"accessURL",
                                                        @"paramReqest",
                                                        @"terminalURL",
                                                        @"transactionData"
                                                        ] forKeys:  @[
                                                                      @"ACSURL",
                                                                      @"PaReq",
                                                                      @"TermUrl",
                                                                      @"MD"
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
