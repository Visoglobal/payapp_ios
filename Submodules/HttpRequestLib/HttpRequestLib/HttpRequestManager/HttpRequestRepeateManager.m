//
//  HttpRequestRepeateManager.m
//  MobileAcquiringCore
//
//  Created by Alexey on 01.10.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import "HttpRequestRepeateManager.h"
#import "HttpRequestOperation.h"

@implementation HttpRequestRepeateManager

- (id) initWithSettings:(HttpRequestSettings*)settings{
    self = [self init];
    if (self) {
        if (settings)
            repeateSettings = settings;
            currentRepeate = 0;
            operationQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void) repeateOperation:(NSObject<RequestOperationProtocol>*)operation analizerClass:(Class)analizerClass complete:(RequestComplete)complete;
{
    responseAnalizerClass = analizerClass?[analizerClass copy]:nil;
    completion = [complete copy];
    currentOperation = [operation copy];
    [self startOperation:operation];
}

-(void)startOperation:(NSObject<RequestOperationProtocol>*)operation
{
    if (operation)
    {
        [operation setOperationCompletion:^(id responseObject, NSError *error) {
            
            NSObject<HttpRequestResponseAnalizerProtocol>* analizeforResponse;
            
            if (responseObject && responseAnalizerClass)
            {
                analizeforResponse = [responseAnalizerClass new];
                [analizeforResponse constructHandlerWithResponseDictionary:responseObject];
            }
            
            if ((!error && !analizeforResponse) || (!error && analizeforResponse && analizeforResponse.operationResult == RequestOperationResultSuccess) || currentRepeate > repeateSettings.repeateCount)
            {
                if (completion)
                    completion(responseObject,error);
            }else{
                currentRepeate++;
                [self startOperation:[currentOperation copy]];
            }
        }];
        [operationQueue addOperation:operation];
    }
}

@end
