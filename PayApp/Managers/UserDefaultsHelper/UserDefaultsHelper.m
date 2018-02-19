//
//  UserDefaultsHelper.m
//  MobileAcquiringCore
//
//  Created by админ on 23.06.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import "UserDefaultsHelper.h"

@implementation UserDefaultsHelper

+ (void) setString:(NSString*)string forKey:(NSString*)key
{
    if (key != nil)
    {
        if (string != nil)
            [[NSUserDefaults standardUserDefaults] setObject:string forKey:key];
        else
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (NSString*) stringForKey:(NSString*)key
{
    if (key == nil)
        return nil;
    
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}

+ (void) setInteger:(NSInteger)integer forKey:(NSString*)key
{
    if (key != nil)
    {
        [[NSUserDefaults standardUserDefaults] setInteger:integer forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (NSInteger) integerForKey:(NSString*)key
{
    if (key == nil)
        return 0;
    
    return [[NSUserDefaults standardUserDefaults] integerForKey:key];
}

+ (void) setBool:(BOOL)boolValue forKey:(NSString*)key
{
    if (key != nil)
    {
        [[NSUserDefaults standardUserDefaults] setBool:boolValue forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (BOOL) boolForKey:(NSString*)key
{
    if (key == nil)
        return NO;
    
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

@end
