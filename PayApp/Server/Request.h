//
//  Request.h
//  SmartDogHome
//
//  Created by админ on 12.06.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerConfig.h"

typedef void(^RequestSuccess)(id responseObject);
typedef void(^RequestFailure)(NSError * error);

@interface Request : NSObject

+ (void) sendRequestWithData:(id)data success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
