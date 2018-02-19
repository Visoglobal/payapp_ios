//
//  ClientListRequest.h
//  PayApp
//
//  Created by Alexey on 18.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface ClientListRequest : BaseRequestModel

@property (nonatomic, copy)  NSString* requestId;
@property (nonatomic, copy)  NSString* localDate;
@property (nonatomic, copy)  NSString* sessionId;
@property (nonatomic, retain) NSArray* contactList;


@end
