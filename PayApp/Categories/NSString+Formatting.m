//
//  NSString+Formatting.m
//  MobileAcquiringCore
//
//  Created by админ on 05.09.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import "NSString+Formatting.h"

@implementation NSString (Formatting)

- (NSString*) stringByRemovingSpaces
{
    return [self stringByRemovingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString*) stringByRemovingControlCharacters
{
    return [self stringByRemovingCharactersInSet:[NSCharacterSet controlCharacterSet]];
}

- (NSString*) stringByRemovingCharactersInSet:(NSCharacterSet*)characterSet
{
    NSArray * stringComponents = [self componentsSeparatedByCharactersInSet:characterSet];
    NSString * resultString = [stringComponents componentsJoinedByString:@""];
    
    return resultString;
}

@end
