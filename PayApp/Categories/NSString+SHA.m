//
//  NSString+SHA.m
//  MKBShop
//
//  Created by админ on 04.02.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import "NSString+SHA.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SHA)

- (NSString*) SHA1String
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

-(NSString*)sha256HashFor:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

- (NSString*) SHA256StringWithSalt:(NSString*)salt
{
    return  [self sha256HashFor:[NSString stringWithFormat:@"%@%@", salt, self]];
    
}

- (NSString*) SHA1StringWithSalt:(NSString*)salt
{
    return [[NSString stringWithFormat:@"%@%@", salt, self] SHA1String];
    
}


@end
