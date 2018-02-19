//
//  HttpRequestSOAPResponseAnalizer.h
//  PayApp
//
//  Created by Alexey on 28.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <HttpRequestLib/HttpRequestManager/HttpRequestSOAPResponseAnalizer.h>

@interface HttpRequestSOAPResponseAnalizer : NSObject<HttpRequestResponseAnalizerProtocol>

@property (nonatomic, readonly) RequestOperationResult operationResult;
- (void) constructHandlerWithResponseDictionary:(NSDictionary*)responseDictionary;

@end
