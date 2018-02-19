//
//  KeyChainManager.h
//  MobileAcquiringCore
//
//  Created by Alexey on 18.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KEYCHAIN_MANAGER [KeyChainManager sharedKeyChainManager]

@interface KeyChainManager : NSObject

- (void) saveObjectIntoKeychain:(id)object forKey:(id)key;
- (id) getObjectFromKeychainForKey:(id)key;
- (void) saveCertNsDataIntoKeychain:(NSArray*)certDataArray;
- (NSArray*) loadCertNsDataFromKeychain;

+ (KeyChainManager *)sharedKeyChainManager;

@end
