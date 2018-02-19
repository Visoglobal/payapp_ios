//
//  HttpRequestOperation.m
//  
//
//  Created by Alexey on 06.10.15.
//
//

#import "HttpRequestOperation.h"
#import "HttpRequestSecurityPolicy.h"

@implementation HttpRequestOperation

- (HttpRequestSettings*) getOperationSettings
{
    return operationSettings;
}


- (id) initWithSettings:(HttpRequestSettings*)settings request:(NSURLRequest*)request{
    
    self = [super initWithRequest:request];
    if (self)
    {        
        if (settings)
            operationSettings = settings;
        
        self.securityPolicy = [HttpRequestSecurityPolicy initWithSettings:operationSettings];
        
        [self setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            __block id _responceObj = responseObject;
            
            __block NSDictionary *userInfo = nil;
            if ([self.request URL]) userInfo = @{NSURLErrorFailingURLErrorKey : [self.request URL]};
            
            __block NSError *operationError = nil;
            
            if (!_responceObj)
                operationError = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorBadServerResponse userInfo:userInfo];            
            
            if (operationSettings && operationSettings.responseSerializer && !operationError)
            {
                [operationSettings.responseSerializer parseData:_responceObj withCommpletion:^(id responseObject, NSError *error) {
                    
                    NSError* answerError = error? error:operationError;
                    
                    if (operationCompletion)
                        operationCompletion(responseObject,answerError);
                }];
                
            }else{
                if (operationCompletion)
                    operationCompletion(_responceObj,operationError);
            }

        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            if (operationCompletion)
                operationCompletion(operation.responseObject,error);
            
        }];
        
        
        
    }
    return self;
}

- (void) startOperationWithCompletion:(RequestComplete)completion{
    
    [self setOperationCompletion:completion];
    if (operationSettings)
        NSLog(@"%@",operationSettings.url);
    [self start];
    
}

- (void) setOperationCompletion:(RequestComplete)completion
{
        operationCompletion = [completion copy];
}

@end

