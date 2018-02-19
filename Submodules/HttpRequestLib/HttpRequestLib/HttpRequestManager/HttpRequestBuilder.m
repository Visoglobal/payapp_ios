//
//  HttpRequestBuilder.m
//  MobileAcquiringCore
//
//  Created by Alexey on 18.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import "HttpRequestBuilder.h"
#import "NSData+Godzippa.h"

@implementation HttpRequestBuilder

+ (NSURLRequest*) initWithSettings:(HttpRequestSettings*)settings andRequest:(NSObject<HttpRequestProtocol>*)requestObject{

    if (!settings || !requestObject)
        return nil;
    
    NSURL* url = settings.url;
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    NSString* xmlString = [settings.requestSerializer buildXMLStringWithOperationString:[requestObject operationString]
                                                                            messageType:[requestObject messageType]
                                                                             messageNum:[requestObject messageNum]
                                                                          andParameters:[requestObject parameters]];
    
    NSData * postBody = [settings.requestSerializer getNSDataFromXMLString:xmlString];
    
    if (!postBody)
    {
        NSLog(@"Request data error");
        return nil;
    }

    NSLog(@"%@",[[NSString alloc] initWithData:postBody encoding:NSUTF8StringEncoding]);
    
    if (settings.gZipEnable)
    {
        NSString * titleHeaderValue = [NSString stringWithFormat:@"%@.%@",[requestObject operationString], [requestObject messageType]];
        
        [request addValue:titleHeaderValue forHTTPHeaderField:@"Title"];
        [request addValue:@"gzip" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
        [request addValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
        
        postBody =  [postBody dataByGZipCompressingWithError:nil];
    }
    else
    {
        [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"none" forHTTPHeaderField:@"Accept-Encoding"];
    }

    [request setHTTPBody:postBody];
    [request addValue:[NSString stringWithFormat:@"%lu", (unsigned long)postBody.length] forHTTPHeaderField:@"Content-Length"];
    
    [request setHTTPMethod:[settings getStringRequestType]];
    [request setTimeoutInterval:settings.timeOutSeconds];
    
    return request;
}

@end
