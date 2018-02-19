//
//  UserDefaultsHelper.h
//  MobileAcquiringCore
//
//  Created by админ on 23.06.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsHelper : NSObject

+ (void) setString:(NSString*)string forKey:(NSString*)key;
+ (NSString*) stringForKey:(NSString*)key;

+ (void) setInteger:(NSInteger)integer forKey:(NSString*)key;
+ (NSInteger) integerForKey:(NSString*)key;

+ (void) setBool:(BOOL)boolValue forKey:(NSString*)key;
+ (BOOL) boolForKey:(NSString*)key;

@end
