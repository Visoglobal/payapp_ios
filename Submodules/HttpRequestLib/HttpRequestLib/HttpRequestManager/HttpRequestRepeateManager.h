//
//  HttpRequestRepeateManager.h
//  MobileAcquiringCore
//
//  Created by Alexey on 01.10.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestRepeateProtocol.h"
#import "HttpRequestOperationProtocol.h"

@interface HttpRequestRepeateManager : NSObject<RequestRepeateProtocol>{
    
    __block HttpRequestSettings* repeateSettings;
    int currentRepeate;

    __block RequestComplete completion;
    __block NSObject <RequestOperationProtocol> * currentOperation;
    __block NSOperationQueue *operationQueue;
    __block Class responseAnalizerClass;
}

- (id) initWithSettings:(HttpRequestSettings*)settings;

@end
