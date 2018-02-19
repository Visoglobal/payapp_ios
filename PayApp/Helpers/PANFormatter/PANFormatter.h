//
//  PANFormatter.h
//  MobileAcquiringCore
//
//  Created by админ on 06.10.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PANFormatter : NSObject


/**
 Returns a formatter for a grouping PAN by whitespaces.
 
 @b Format
 
 
 0000 0000 0000 0000 for Visa, MC
 
 0000 000000 00000 for Amex
 
 For example:
 
 1234 1234 1234 1234
 
 1234 123456 12345
 
 @return PANFormatter
 */
+ (PANFormatter*) whitespaceGroupingPanFormatter;


/**
 Returns a formatter for a masking PAN by star signs.
 
 @b Format
 
 
 ************0000 for Visa, MC
 
 ***********0000 for Amex
 
 For example:
 
 ************1234
 
 ***********1234
 
 @return PANFormatter
 */
+ (PANFormatter*) maskedLastFourNumberPanFormatter;

/**
 Returns a formatted string representation of a given PAN by format.
 
 @param PAN 16 or 15 digit number of card
 
 @return formatted PAN
 */
- (NSString *) stringFromPAN:(NSString*)pan;


/**
 Set formats array to formatter.
 
 @b Characters:
 
 
 Numbers (0-9) and whitespaces will be applied to grouping number
 
 Any other characters will replace the card number at the specified positions
 
 @param formats An NSArray with format in NSString
 */
- (void) setFormats:(NSArray*)formats;

@end
