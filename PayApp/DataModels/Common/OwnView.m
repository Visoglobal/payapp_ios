//
//  OwnView.m
//  PayApp
//
//  Created by Alexey on 08.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "OwnView.h"

@implementation OwnView


-(NSString*)rootName
{
    return @"Own";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"cardId",
                                                        @"cardName",
                                                        @"maskedPAN",
                                                        @"approvalCode",
                                                        @"amount",
                                                        @"feeAmount",
                                                        @"currency"
                                                        ] forKeys:  @[
                                                                      @"CardId",
                                                                      @"CardName",
                                                                      @"MaskedPAN",
                                                                      @"ApprovalCode",
                                                                      @"Amount",
                                                                      @"FeeAmount",
                                                                      @"Currency"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   };
}

-(NSArray*) attributes
{
    return nil;
}
@end
