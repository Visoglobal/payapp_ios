//
//  UserManager.m
//  PayApp
//
//  Created by Alexey on 13.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "UserManager.h"
#import "DeviceHelper.h"

@implementation UserManager

+ (instancetype) sharedUserManager
{
    static UserManager * _sharedUserManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedUserManager = [[UserManager alloc] init];
    });
    
    return _sharedUserManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {

        _serverDate   = [self stringForKey:kKeyServerDate];
        _allowFinance = [self uintForKey:kKeyAllowFinance]?YES:NO;
        _sessionId    = [self stringForKey:kKeySessionId];
        _expiryDate   = [self stringForKey:kKeyExpiryDate];
        _contact      = [self objectForKey:kKeyContact]?(User*)[self objectForKey:kKeyContact]:[User new];
        _userDefaultCardNum = [self stringForKey:kKeyDefauldCardNum];
        _userPhoto = [self objectForKey:kKeyUserPhoto]?(UIImage*)[self objectForKey:kKeyUserPhoto]:[UIImage imageNamed:@"payapp_menu_reg2_user_nonpicture.png"];
    }
    return self;
}

-(void)saveUserData
{
    [self storeString:_serverDate forKey:kKeyServerDate];
    [self storeUInt:_allowFinance?1:0 forKey:kKeyAllowFinance];
    [self storeString:_sessionId forKey:kKeySessionId];
    [self storeString:_expiryDate forKey:kKeyExpiryDate];
    [self storeObject:_contact forKey:kKeyContact];
    [self storeString:_userDefaultCardNum forKey:kKeyDefauldCardNum];
    [self storeObject:_userPhoto forKey:kKeyUserPhoto];
}

-(Device*)userDevice
{
    Device* device = [Device new];
    device.deviceType = @"ios";
    device.deviceToken = self.deviceToken;
    
    return device;
}

-(void)clearUserData
{
    self.serverDate   = nil;
    self.allowFinance = NO;
    self.sessionId    = nil;
    self.expiryDate   = nil;
    self.contact      = [User new];
    self.userDefaultCardNum = nil;
    self.userPhoto = nil;
}

-(void)setUserPhoto:(UIImage *)userPhoto
{
    _userPhoto = userPhoto;
    [self storeObject:_userPhoto forKey:kKeyUserPhoto];
    [self sendUpdateNotification];
}

-(void)setUserDefaultCardNum:(NSString *)userDefaultCardNum
{
    _userDefaultCardNum = userDefaultCardNum;
    [self storeString:userDefaultCardNum forKey:kKeyDefauldCardNum];
    [self sendUpdateNotification];
}

-(void)setServerDate:(NSString *)serverDate
{
    _serverDate = serverDate;
    [self storeString:serverDate forKey:kKeyServerDate];
    [self sendUpdateNotification];
}

-(void)setAllowFinance:(BOOL)allowFinance
{
    _allowFinance = allowFinance;
    [self storeUInt:allowFinance?1:0 forKey:kKeyAllowFinance];
    [self sendUpdateNotification];
}

-(void)setSessionId:(NSString *)sessionId
{
    _sessionId = sessionId;
    [self storeString:sessionId forKey:kKeySessionId];
    [self sendUpdateNotification];
}

-(void)setExpiryDate:(NSString *)expiryDate
{
    _expiryDate = expiryDate;
    [self storeString:expiryDate forKey:kKeyExpiryDate];
    [self sendUpdateNotification];
}

-(void)setContact:(User *)contact
{
    _contact = contact;
    [self saveContact];
}

-(void)saveContact
{
    [self storeObject:_contact forKey:kKeyContact];
    [self sendUpdateNotification];
}

- (NSUInteger) uintForKey:(NSString*)key
{
    if (!key || key.length == 0)
        return 0;
    
    return [[NSUserDefaults standardUserDefaults] integerForKey:key]?[[NSUserDefaults standardUserDefaults] integerForKey:key]:0;
}

- (NSString*) stringForKey:(NSString*)key
{
    if (!key || key.length == 0)
        return 0;
    return [[NSUserDefaults standardUserDefaults] stringForKey:key]?[[NSUserDefaults standardUserDefaults] stringForKey:key]:@"";
}


- (void) storeUInt:(NSUInteger)uint forKey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setInteger:uint forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) storeString:(NSString*)string forKey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setValue:string forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) storeObject:(NSObject*)object forKey:(NSString *)key
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
    
}

- (NSObject*) objectForKey:(NSString*)key
{
    if (!key || key.length == 0)
        return nil;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    NSObject *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

-(void)sendUpdateNotification
{
        [[NSNotificationCenter defaultCenter] postNotificationName:userDataUpdateNotification object:nil];
}
@end
