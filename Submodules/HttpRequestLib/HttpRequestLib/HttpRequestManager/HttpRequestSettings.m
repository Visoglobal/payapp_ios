//
//  HttpRequestSettings.m
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import "HttpRequestSettings.h"
#import "HttpRequestXMLRequestSerializer.h"
#import "HttpRequestXMLResponceSerializer.h"
#import "serverConfig.h"
#import "HttpRequestRepeateManager.h"
#import "HttpRequestOperationHandler.h"

@implementation HttpRequestSettings

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _url = [NSURL URLWithString:kServerURL];        
        [[NSUserDefaults standardUserDefaults] synchronize];
        _gZipEnable = [[NSUserDefaults standardUserDefaults] boolForKey:@"gzipCompression"] || gzipEnabled;
        _sslEnable  = [[NSUserDefaults standardUserDefaults] boolForKey:@"sslCertification"] || sslEnabled;
        _sslCertificates = nil;
        _operationHandlerClass = [HttpRequestOperationHandler class];
        _requestType = POST;
        _repeateCount = 1;
        _timeOutSeconds = 5;
        _requestSerializer = [HttpRequestXMLRequestSerializer new];
        _responseSerializer = [HttpRequestXMLResponceSerializer new];
        _repeateManager = [[HttpRequestRepeateManager alloc] initWithSettings:self];
    }
    return self;
}

-(void) setOperationHandlerClass:(Class)operationHandlerClass
{
    if ([operationHandlerClass conformsToProtocol:@protocol(RequestOperationHandlerProtocol)])
    {
        _operationHandlerClass = operationHandlerClass;
    }else{
        @throw [NSException exceptionWithName:@"BadOperationHandlerClass"
                                       reason:[NSString stringWithFormat:@"Method '%@' should be set only RequestOperationHandlerProtocol classes", NSStringFromSelector(_cmd)] userInfo:nil];
    }
}

-(NSString*) getStringRequestType{
    
    return  [@{@(POST) : @"POST",
                @(GET) : @"GET",
               @(HEAD) : @"HEAD",
                @(PUT) : @"PUT",
              @(PATCH) : @"PATCH",
             @(DELETE) : @"DELETE"} objectForKey:@(_requestType)];
}

@end
