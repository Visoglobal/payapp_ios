//
//  NSString+Formatting.h
//  MobileAcquiringCore
//
//  Created by админ on 05.09.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Formatting)

- (NSString*) stringByRemovingSpaces;
- (NSString*) stringByRemovingControlCharacters;

@end
