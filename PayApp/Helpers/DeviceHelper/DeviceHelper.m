//
//  DeviceHelper.m
//  BankCardDemo
//
//  Created by админ on 25.07.13.
//
//

#import "DeviceHelper.h"
#import "UIDevice+IdentifierAddition.h"

#define kScreenSize4 480.0f
#define kScreenSize5 568.0f
#define kScreenSize6 667.0f
#define kScreenSize6plus 736.0f

#define kScreenSizeWidth 320.0f
#define kScreenSize6Width 375.0f
#define kScreenSize6plusWidth 414.0f


#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

@implementation DeviceHelper

+ (BOOL) isIphone4
{
    CGRect cgRect =[[UIScreen mainScreen] bounds];
    CGSize cgSize = cgRect.size;
    
    if (cgSize.height == kScreenSize4)
        return YES;
    
    return NO;
}

+ (BOOL) isIphone5
{
    CGRect cgRect =[[UIScreen mainScreen] bounds];
    CGSize cgSize = cgRect.size;
    
    if (cgSize.height == kScreenSize5)
        return YES;
    
    return NO;
}

+ (CGFloat) screenWidth
{
    if (IS_IPHONE_6)
        return kScreenSize6Width;
    else if (IS_IPHONE_6_PLUS)
        return kScreenSize6plusWidth;
    else
        return kScreenSizeWidth;
}

+ (CGFloat) bottomPositionY
{
    if ([self isIphone5])
        return kScreenSize5;
    else if (IS_IPHONE_6)
        return kScreenSize6;
    else if (IS_IPHONE_6_PLUS)
        return kScreenSize6plus;
    else
        return kScreenSize4;
}

+ (CGFloat) bottomPositionYWithoutTopBar
{
    return [self bottomPositionY] - 64;
}

+ (NSString*) versionString
{
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];

    NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
    
    return [NSString stringWithFormat: @"Версия: %@", version];
}

#pragma mark udid

+ (NSString*) udid
{
    if ([self isIOS6]){
        return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }else
        return [[UIDevice currentDevice] uniqueGlobalDeviceIdentifier];
}

+ (NSString*) udid6first
{
    NSString * udid6first = [[self udid] substringToIndex:6];
    
    return udid6first;
}

+ (BOOL) isIOS6
{
    return [self iOSVersion] >= 6.0;
}

+ (BOOL) isIOS7
{
    return [self iOSVersion] >= 7.0;
}

+ (BOOL) isIOS8
{
    return [self iOSVersion] >= 8.0;
}

+ (float) iOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

@end
