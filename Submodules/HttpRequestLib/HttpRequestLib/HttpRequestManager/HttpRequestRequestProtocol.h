//
//  HttpRequestProtocol.h
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol HttpRequestProtocol

    - (NSArray*)  parameters;
    - (NSString*) operationString;
    - (NSString*) messageType;
    - (NSString*) messageNum;

@end

