//
//  NSString+SHA.h
//  MKBShop
//
//  Created by админ on 04.02.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SHA)

- (NSString*) SHA1String;
- (NSString*) SHA1StringWithSalt:(NSString*)salt;
- (NSString*) SHA256StringWithSalt:(NSString*)salt;
@end
