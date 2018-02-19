//
//  HttpRequestOperationHandlerProtocol.h
//  MobileAcquiringCore
//
//  Created by Alexey on 19.10.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestOperationHandlerProtocol

@property (nonatomic, readonly) NSDictionary * body;

- (void) constructHandlerWithResponseDictionary:(NSDictionary*)responseDictionary;

@end
