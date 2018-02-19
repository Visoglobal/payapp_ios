//
//  HttpRequestOperationProtocol.h
//  MobileAcquiringCore
//
//  Created by Alexey on 06.10.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol RequestOperationProtocol

- (void) startOperationWithCompletion:(void (^)(id responseObject,NSError * error))completion;
- (void) setOperationCompletion:(void (^)(id responseObject,NSError * error))completion;
@end
