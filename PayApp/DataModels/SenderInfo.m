//
//  SenderInfo.m
//  PayApp
//
//  Created by Alexey on 23.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "SenderInfo.h"

@implementation SenderInfo

-(NSString*)rootName
{
    return @"SenderInfo";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"cardId",
                                                        @"pan"
                                                        ] forKeys:  @[
                                                                      @"CardId",
                                                                      @"PAN"
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
