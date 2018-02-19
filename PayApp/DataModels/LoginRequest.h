//
//  LoginRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "Device.h"

@interface LoginRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* login;
@property (nonatomic, copy) NSString* password;
@property (nonatomic, retain) Device*   device;

@end

//<AppLoginRq>
//<Version>1</Version>
//<RqId>str1234</RqId>
//<LocalDate>2012-12-13T12:12:12</LocalDate>
//<Login>str1234</Login>
//<Passwd>str1234</Passwd>
//</AppLoginRq>