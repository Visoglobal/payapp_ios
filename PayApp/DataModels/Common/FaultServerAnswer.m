//
//  FaultServerAnswer.m
//  PayApp
//
//  Created by Alexey on 13.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "FaultServerAnswer.h"

@implementation FaultServerAnswer


-(NSString*)rootName
{
    return @"Fault";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"detail",
                                                        @"faultcode",
                                                        @"faultstring"
                                                        ] forKeys: @[
                                                                     @"detail",
                                                                     @"faultcode",
                                                                     @"faultstring"
                                                                     ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{};
}

-(NSError*)getError
{
    if (self.faultcode && self.faultcode.length>0 && self.faultstring && self.faultstring.length>0)
        return [NSError errorWithDomain:@"app" code:400 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:self.faultcode,NSLocalizedFailureReasonErrorKey,
                                                                  self.faultstring,NSLocalizedDescriptionKey,
                                                                   nil]];
    return nil;
}

@end
