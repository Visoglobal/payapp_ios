//
//  UserManager.h
//  PayApp
//
//  Created by Alexey on 13.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Device.h"

#define kKeyServerDate @"kKeyServerDate"
#define kKeyAllowFinance @"kKeyAllowFinance"
#define kKeySessionId @"kKeySessionId"
#define kKeyExpiryDate @"kKeyExpiryDate"
#define kKeyDefauldCardNum @"kKeyDefauldCardNum"
#define kKeyContact @"kKeyContact"
#define kKeyUserPhoto @"kKeyUserPhoto"

#define USER_MANAGER [UserManager sharedUserManager]

@interface UserManager : NSObject

@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic)           BOOL  allowFinance;
@property (nonatomic, copy) NSString* sessionId;
@property (nonatomic, copy) NSString* expiryDate;
@property (nonatomic, retain)   User* contact;
@property (nonatomic, retain)NSArray* contactList; //list of Contact*
@property (nonatomic, copy) NSString* userDefaultCardNum;
@property (nonatomic, copy)  UIImage* userPhoto;

@property (nonatomic, copy) NSString* currency;
@property (nonatomic, copy) NSString* transactionMinFeeValue;
@property (nonatomic, copy) NSString* transactionFee;
@property (nonatomic, copy) NSString* userDefaultCardId;

@property (nonatomic, copy) NSString* deviceToken;

@property (nonatomic, readonly) Device* userDevice;

+ (instancetype) sharedUserManager;
- (void) clearUserData;
- (void) saveUserData;
- (void) saveContact;
@end

