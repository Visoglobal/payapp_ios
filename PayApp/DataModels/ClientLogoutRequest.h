//
//  ClientLogoutRequest.h
//  PayApp
//
//  Created by Alexey on 12.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface ClientLogoutRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;


@end
