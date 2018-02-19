//
//  HttpRequestOperation.h
//  
//
//  Created by Alexey on 06.10.15.
//
//

#import <Foundation/Foundation.h>
#import "HttpRequestSettings.h"
#import "HttpRequestOperationProtocol.h"

@interface HttpRequestOperation : AFHTTPRequestOperation<RequestOperationProtocol>
{
    __block RequestComplete operationCompletion;
    __block HttpRequestSettings* operationSettings;
}

- (id) initWithSettings:(HttpRequestSettings*)settings request:(NSURLRequest*)request;

@end

