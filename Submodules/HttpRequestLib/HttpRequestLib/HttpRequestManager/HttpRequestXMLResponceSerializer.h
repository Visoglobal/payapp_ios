//
//  HttpRequestXMLResponceSerializer.h
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestResponceSerializerProtocol.h"
#import "ServerResponseXMLParser.h"

@interface HttpRequestXMLResponceSerializer : NSObject<ResponceSerializerProtocol>{
        __block void ((^_completion)(id responseObject,NSError * error));
        ServerResponseXMLParser* xmlParser;
}
- (void)parseData:(NSData*)data withCommpletion:(void (^)(id responseObject,NSError * error))_complete;
@end
