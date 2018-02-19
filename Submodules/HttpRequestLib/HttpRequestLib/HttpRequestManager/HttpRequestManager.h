//
//  HttpRequestManager.h
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestSettings.h"
#import "HttpRequestRequestProtocol.h"
#import "HttpRequestResponseAnalizerProtocol.h"

@interface HttpRequestManager : NSObject{

    HttpRequestSettings* globalSettings;
    HttpRequestSettings* localSettings;
    NSURLRequest* request;
    NSOperationQueue *operationQueue;
}

// accept only HttpRequestResponseAnalizerProtocol classes
@property (nonatomic) Class responseAnalizerClass;

- (id) initWithSettings:(HttpRequestSettings*)settings;

- (void) sendRequest:(NSObject<HttpRequestProtocol>*)requestObject complete:(RequestComplete)complete;
- (void) sendRequest:(NSObject<HttpRequestProtocol>*)requestObject settings:(HttpRequestSettings*)settings complete:(RequestComplete)complete;
- (void) setReqestsSettings:(HttpRequestSettings*)settings;


@end
