//
//  KeyChainManager.m
//  MobileAcquiringCore
//
//  Created by Alexey on 18.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import "KeyChainManager.h"
#import "KeychainItemWrapper.h"

@implementation KeyChainManager

static KeyChainManager * sharedKeyChainManager = NULL;

+ (KeyChainManager *)sharedKeyChainManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (sharedKeyChainManager == NULL)
        {
            sharedKeyChainManager = [KeyChainManager new];
        }
        
    });
    
    return sharedKeyChainManager;
}

-(void)saveObjectIntoKeychain:(id)object forKey:(id)key{
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:bundleIdentifier accessGroup:nil];
    [keychain resetKeychainItem];
    [keychain setObject:object forKey:key];
}

-(id)getObjectFromKeychainForKey:(id)key{
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:bundleIdentifier accessGroup:nil];
    return [keychain objectForKey:key];
}

-(void)saveCertNsDataIntoKeychain:(NSArray*)certDataArray
{
    NSError *error;
    if (certDataArray){
        NSDictionary* obj = [[NSDictionary alloc] initWithObjectsAndKeys:certDataArray,certKeyChainKey, nil];
    
        NSData *dictionaryRep = [NSPropertyListSerialization dataFromPropertyList:obj format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
        NSString *xml = [[NSString alloc] initWithBytes:[dictionaryRep bytes] length:[dictionaryRep length] encoding:NSUTF8StringEncoding];
        
        NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:bundleIdentifier accessGroup:nil];
        [keychain resetKeychainItem];
        [keychain setObject:xml forKey:(__bridge id)(kSecValueData)];
    }
}

-(NSArray*)loadCertNsDataFromKeychain
{
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:bundleIdentifier accessGroup:nil];
    NSError *error;
    NSString *xml = [keychain objectForKey:(__bridge id)(kSecValueData)];
    if (xml && xml.length) {
        NSData *dictionaryRep = [xml dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* dict = [NSPropertyListSerialization propertyListWithData:dictionaryRep options:NSPropertyListImmutable format:nil error:&error];
        if (!dict)
            return nil;
        NSArray* certDataArray = [dict objectForKey:certKeyChainKey];
        return certDataArray;
    }
    
    return nil;
}

@end
