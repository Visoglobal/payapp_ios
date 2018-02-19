//
//  HttpRequestRepeateProtocol.h
//  MobileAcquiringCore
//
//  Created by Alexey on 01.10.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestSettings.h"
#import "HttpRequestOperationProtocol.h"

@protocol RequestRepeateProtocol

- (void) repeateOperation:(NSObject<RequestOperationProtocol>*)operation  analizerClass:(Class)analizerClass complete:(void (^)(id responseObject,NSError * error))complete;

@end
