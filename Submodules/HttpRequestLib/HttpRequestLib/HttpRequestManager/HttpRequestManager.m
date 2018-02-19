//
//  HttpRequestManager.m
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import "HttpRequestManager.h"
#import "HttpRequestBuilder.h"
#import "HttpRequestOperation.h"
#import "HttpRequestOperationHandlerProtocol.h"
#import "HttpRequestResponseAnalizer.h"

@implementation HttpRequestManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        globalSettings = [HttpRequestSettings new];
        localSettings = globalSettings;
        operationQueue = [[NSOperationQueue alloc] init];
        _responseAnalizerClass = [HttpRequestResponseAnalizer class];
    }
    return self;
}

-(void)setResponseAnalizerClass:(Class)responseAnalizerClass
{
    if ([responseAnalizerClass conformsToProtocol:@protocol(HttpRequestResponseAnalizerProtocol)])
    {
        _responseAnalizerClass = responseAnalizerClass;
    }else{
        @throw [NSException exceptionWithName:@"BadResponseAnalizerClass"
                                       reason:[NSString stringWithFormat:@"Method '%@' should be set only HttpRequestResponseAnalizerProtocol classes", NSStringFromSelector(_cmd)] userInfo:nil];
    }
}

- (id) initWithSettings:(HttpRequestSettings*)settings
{
    self = [self init];
    if (self) {
        [self setReqestsSettings:settings];
    }
    return self;
}

- (void) setReqestsSettings:(HttpRequestSettings*)settings
{
    if (settings){
        globalSettings = settings;
    }
    localSettings = globalSettings;
}

- (void) sendRequest:(NSObject<HttpRequestProtocol>*)requestObject complete:(RequestComplete)complete{
    [self sendRequest:requestObject settings:globalSettings complete:complete];
}

- (void) sendRequest:(NSObject<HttpRequestProtocol>*)requestObject settings:(HttpRequestSettings*)settings complete:(RequestComplete)complete{
    
    
    HttpRequestOperation *operation = [self getRequestOperationWithSettings:settings andRequest:requestObject];
    [operation setOperationCompletion:^(id responseObject, NSError *error) {

        if (responseObject && _responseAnalizerClass)
        {
            NSObject<HttpRequestResponseAnalizerProtocol>* analizeforResponse = [_responseAnalizerClass new];
            [analizeforResponse constructHandlerWithResponseDictionary:responseObject];
            
            if (analizeforResponse.operationResult == RequestOperationResultNeedRepeate && settings.repeateManager)
            {
                [settings.repeateManager repeateOperation:[self getRequestOperationWithSettings:settings andRequest:requestObject] analizerClass:_responseAnalizerClass complete:^(id responseObject, NSError *error) {
                    
                    [self sendRequestCompletionWithResponse:responseObject andError:error andSettings:settings andComplete:complete];
                }];
            }else{
                [self sendRequestCompletionWithResponse:responseObject andError:error andSettings:settings andComplete:complete];
            }
        }else{
            if (complete)
                complete(responseObject,error);
        }

    }];
    [operationQueue addOperation:operation];
}

-(void) sendRequestCompletionWithResponse:(id)responseObject andError:(NSError *)error andSettings:(HttpRequestSettings*)settings andComplete:(RequestComplete)complete
{
    if (responseObject && settings && settings.operationHandlerClass)
    {
        NSObject<RequestOperationHandlerProtocol>* response = [settings.operationHandlerClass  new];
        [response constructHandlerWithResponseDictionary:responseObject];
        if (complete)
            complete(response,error);
    }else
        if (complete)
            complete(responseObject,error);
}

-(HttpRequestOperation*) getRequestOperationWithSettings:(HttpRequestSettings*)settings andRequest:(NSObject<HttpRequestProtocol>*)requestObject
{
    if (settings)
        localSettings = settings;
    
    request = [HttpRequestBuilder initWithSettings:localSettings andRequest:requestObject];
    HttpRequestOperation *operation = [[HttpRequestOperation alloc] initWithSettings:localSettings request:request];
    
    return operation;
}

@end
