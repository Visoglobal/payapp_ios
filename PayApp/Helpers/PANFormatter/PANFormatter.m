//
//  PANFormatter.m
//  MobileAcquiringCore
//
//  Created by админ on 06.10.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import "PANFormatter.h"

@interface PANFormatterMask : NSObject

@property (nonatomic, readonly) NSUInteger lenght;
@property (nonatomic, readonly) NSString * mask;

- (instancetype)initWithLenght:(NSUInteger)lenght mask:(NSString*)mask;

@end

@implementation PANFormatterMask

+ (instancetype)maskWithString:(NSString*)mask
{
    return [[[[self class] alloc] initWithMask:mask] autorelease];
}

- (instancetype)initWithMask:(NSString*)mask
{
    self = [super init];
    if (self) {
        _mask = [mask copy];
        
        [self updateLenght];
    }
    return self;
}

- (void)dealloc
{
    [_mask release]; _mask = nil;
    
    [super dealloc];
}

- (void) updateLenght
{
    NSString * maskWithoutSpaces = [self.mask stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    _lenght = maskWithoutSpaces.length;
}

@end

@interface PANFormatter ()
{
    NSMutableArray * _panMasks;
}

@end

@implementation PANFormatter

+ (PANFormatter*) whitespaceGroupingPanFormatter
{
    PANFormatter * formatter = [[PANFormatter new] autorelease];
   
    [formatter setFormats:@[@"0000 0000 0000 0000",
                            @"0000 000000 00000"]];

    return formatter;
}

+ (PANFormatter*) maskedLastFourNumberPanFormatter
{
    PANFormatter * formatter = [[PANFormatter new] autorelease];
    
    [formatter setFormats:@[@"************0000",
                            @"***********0000"]];
    
    return formatter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _panMasks = [NSMutableArray new];
    }
    return self;
}

- (void)dealloc
{
    [_panMasks release]; _panMasks = nil;
    
    [super dealloc];
}

- (void) setFormats:(NSArray*)formats
{
    [_panMasks removeAllObjects];
    
    for (NSString * oneFormatString in formats)
    {
        if ([oneFormatString isKindOfClass:[NSString class]])
            [_panMasks addObject:[PANFormatterMask maskWithString:oneFormatString]];
    }
}

- (NSString *) stringFromPAN:(NSString*)pan
{
    NSString * panWithoutSpaces = [pan stringByReplacingOccurrencesOfString:@" " withString:@""];

    PANFormatterMask * mask = [self maskForLenght:panWithoutSpaces.length];
    
    if (mask == nil)
        return pan;
    else
        return [self stringByApplyMask:mask toString:pan];
}


#pragma mark - Masks Methods

- (PANFormatterMask*) maskForLenght:(NSUInteger)lenght
{
    for (PANFormatterMask * oneMask in _panMasks)
    {
        if (oneMask.lenght == lenght)
            return oneMask;
    }
    
    return nil;
}

- (NSString*) stringByApplyMask:(PANFormatterMask*)mask toString:(NSString*)string
{
    if (string == nil)
        return nil;
    
    NSString * panWithoutSpaces = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSMutableString * formattedPan = [NSMutableString stringWithString:panWithoutSpaces];

    if (panWithoutSpaces.length != mask.lenght)
        return string;
    
    for (int i=0; i<mask.mask.length; i++)
    {
        unichar oneChar = [mask.mask characterAtIndex:i];
        
        NSCharacterSet * decimalCharacters = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet * whitespaceCharcaters = [NSCharacterSet whitespaceCharacterSet];

        if ([whitespaceCharcaters characterIsMember:oneChar])
            [formattedPan insertString:@" " atIndex:i];
        
        if (![decimalCharacters characterIsMember:oneChar] && ![whitespaceCharcaters characterIsMember:oneChar])
            [formattedPan replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", oneChar]];
    }
    
    return [NSString stringWithString:formattedPan];
}

@end
