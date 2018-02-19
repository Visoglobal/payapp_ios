//
//  HttpRequestResponseAnalizatorProtocol.h
//  MobileAcquiringCore
//
//  Created by Alexey on 20.10.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef  NS_ENUM(NSUInteger, RequestOperationResult)
{
    RequestOperationResultSuccess       = 0,
    RequestOperationResultError         = 1,
    RequestOperationResultNeedRepeate   = 2
};

@protocol HttpRequestResponseAnalizerProtocol


@property (nonatomic, readonly) RequestOperationResult operationResult;

- (void) constructHandlerWithResponseDictionary:(NSDictionary*)responseDictionary;

@end
