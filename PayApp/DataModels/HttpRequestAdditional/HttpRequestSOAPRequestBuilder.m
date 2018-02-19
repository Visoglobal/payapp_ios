//
//  HttpRequestSOAPRequestBuilder.m
//  PayApp
//
//  Created by Alexey on 11.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "HttpRequestSOAPRequestBuilder.h"

@implementation HttpRequestSOAPRequestBuilder

+ (NSURLRequest*) initWithSettings:(HttpRequestSettings*)settings andRequest:(NSObject<HttpRequestProtocol>*)requestObject
{
    NSMutableURLRequest* request = (NSMutableURLRequest*)[HttpRequestBuilder initWithSettings:settings andRequest:requestObject];
    [request addValue:@"http://www.m4bank.ru/P2P" forHTTPHeaderField:@"SOAPAction"];
    [request setTimeoutInterval:settings.timeOutSeconds];
    return request;
}
@end
