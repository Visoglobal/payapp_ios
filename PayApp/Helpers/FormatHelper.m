//
//  FormatHelper.m
//  PayApp
//
//  Created by Alexey on 12.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "FormatHelper.h"

@implementation FormatHelper


+ (BOOL) validateEmail: (NSString *) candidate
{
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}


+ (NSString*) stringDateTimeFromDate:(NSDate*)formattedDate
{
    if (formattedDate)
    {
    //    2015-11-18T14:15:04.128+03:00
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZZZZZ"];
        return [[format stringFromDate:formattedDate] stringByReplacingOccurrencesOfString:@" " withString:@"T"];
    }
    return nil;
}

+ (NSString*) stringDateFromDate:(NSDate*)formattedDate
{
    if (formattedDate)
    {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        return [format stringFromDate:formattedDate];
    }
    return nil;
}

+ (NSString*) stringCardExpireDateFromDate:(NSDate*)formattedDate
{
    if (formattedDate)
    {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM"];
        return [format stringFromDate:formattedDate];
    //    "2001-10"
    }
    return nil;
}

+(NSDate*)getBirthdateFromString:(NSString*)birthdateString
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-ddZZZZZ"];
    return [format dateFromString:birthdateString];
//    2014-01-19+04:00
}

+(NSString*)getBirthdateStringFromDate:(NSDate*)birthdate
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-ddZZZZZ"];
    return [format stringFromDate:birthdate];
    //    2014-01-19+04:00
}

+(NSString*)amountInMainUnitsFromMinimalUnits:(NSString*)minimalUnits
{
    if (!minimalUnits || ![minimalUnits integerValue])
        return @"0.00";

    NSString* amount = [NSString stringWithFormat:@"%.2f",[minimalUnits floatValue]/100];
    
    return amount;
}

+(NSString*)amountInMinimalUnitsFromMainUnits:(NSString*)mainUnits
{
    if (!mainUnits || ![mainUnits floatValue])
        return @"0";
    
    NSString* newVal = [mainUnits stringByReplacingOccurrencesOfString:@"," withString:@"."];
    float floatVal = [newVal floatValue];
    floatVal *= 100;
    
    return [NSString stringWithFormat:@"%.0f",floatVal];
}

@end
