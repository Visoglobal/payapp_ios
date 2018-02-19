//
//  ClientRegisterFinRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "Device.h"

@interface ClientRegisterFinRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* login;
@property (nonatomic, copy) NSString* password;
@property (nonatomic, copy) NSString* verifyCode;
@property (nonatomic, copy) NSString* familyName;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* parentName;
@property (nonatomic, copy) NSString* birthDate;
@property (nonatomic, copy) NSString* sex;
@property (nonatomic, copy) NSString* allowProfileView;
@property (nonatomic, retain) Device*   device;
@end

//<AppClientRegisterFinRq>
//<RqId>str1234</RqId>
//<LocalDate>2012-12-13T12:12:12</LocalDate>
//<Login>str1234</Login>
//<Passwd>str1234</Passwd>
//<VerifyCode>str1234</VerifyCode>
//<FamilyName>str1234</FamilyName>
//<Name>str1234</Name>
//<ParentName>str1234</ParentName>
//<BirthDate>2012-12-13</BirthDate>
//<Sex>male</Sex>
//<AllowProfileView>true</AllowProfileView>
//</AppClientRegisterFinRq>