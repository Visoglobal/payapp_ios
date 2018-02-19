//
//  HttpRequestBuilder.h
//  MobileAcquiringCore
//
//  Created by Alexey on 18.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestSettings.h"
#import "HttpRequestRequestProtocol.h"

@interface HttpRequestBuilder : NSObject

+ (NSURLRequest*) initWithSettings:(HttpRequestSettings*)settings andRequest:(NSObject<HttpRequestProtocol>*)requestObject;

@end
