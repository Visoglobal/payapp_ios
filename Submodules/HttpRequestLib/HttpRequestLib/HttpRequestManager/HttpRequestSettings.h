//
//  HttpRequestSettings.h
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestRequestSerializerProtocol.h"
#import "HttpRequestResponceSerializerProtocol.h"
#import "HttpRequestRepeateProtocol.h"
#import "HttpRequestOperationHandlerProtocol.h"

typedef void(^RequestComplete)(id responseObject,NSError * error);

typedef  NS_ENUM(NSUInteger, RequestTypes){
    POST   = 0,
    GET    = 1,
    HEAD   = 2,
    PUT    = 3,
    PATCH  = 4,
    DELETE = 5
};

@interface HttpRequestSettings : NSObject

@property (nonatomic, copy)   NSObject<RequestSerializerProtocol> *  requestSerializer;
@property (nonatomic, copy)   NSObject<ResponceSerializerProtocol>*  responseSerializer;
@property (nonatomic, copy)   NSObject<RequestRepeateProtocol>*      repeateManager;

//only for classes wich realize RequestOperationHandlerProtocol
@property (nonatomic)         Class operationHandlerClass;

@property (nonatomic, copy)   NSURL * url;
@property (nonatomic, copy)   NSArray * sslCertificates;

@property (nonatomic, assign) BOOL gZipEnable;
@property (nonatomic, assign) BOOL sslEnable;

@property (nonatomic, assign) RequestTypes requestType;

@property (nonatomic, assign) int repeateCount;
@property (nonatomic, assign) int timeOutSeconds;

-(NSString*) getStringRequestType;

@end
