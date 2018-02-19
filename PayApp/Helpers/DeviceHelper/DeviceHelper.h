//
//  DeviceHelper.h
//  BankCardDemo
//
//  Created by админ on 25.07.13.
//
//

#import <Foundation/Foundation.h>

@interface DeviceHelper : NSObject

+ (BOOL) isIphone5;
+ (BOOL) isIphone4;

+ (CGFloat) screenWidth;
+ (CGFloat) bottomPositionY;
+ (CGFloat) bottomPositionYWithoutTopBar;

+ (NSString*) versionString;

+ (NSString*) udid;

+ (BOOL) isIOS8;
+ (BOOL) isIOS7;
+ (BOOL) isIOS6;
+ (float) iOSVersion;

@end
