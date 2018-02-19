//
//  FormatHelper.h
//  PayApp
//
//  Created by Alexey on 12.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormatHelper : NSObject

+ (BOOL) validateEmail: (NSString *)candidate;
+ (NSString*) stringDateTimeFromDate:(NSDate*)formattedDate;
+ (NSString*) stringDateFromDate:(NSDate*)formattedDate;
+ (NSString*) stringCardExpireDateFromDate:(NSDate*)formattedDate;
+ (NSDate*) getBirthdateFromString:(NSString*)birthdateString;
+ (NSString*) getBirthdateStringFromDate:(NSDate*)birthdate;
+ (NSString*) amountInMainUnitsFromMinimalUnits:(NSString*)minimalUnits;
+ (NSString*) amountInMinimalUnitsFromMainUnits:(NSString*)mainUnits;

@end
