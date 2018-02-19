//
//  ClientEditRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "Device.h"

@interface ClientEditRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;

@property (nonatomic, copy) NSString* familyName;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* parentName;
@property (nonatomic, copy) NSString* birthDate;
@property (nonatomic, copy) NSString* sex;
@property (nonatomic, copy) NSString* allowProfileView;
@property (nonatomic, copy) NSString* base64imageString;
@property (nonatomic, retain) Device*   device;
@end

//<xs:element name="FamilyName" type="xs:string" minOccurs="0"/>
//<xs:element name="Name" type="xs:string" minOccurs="0"/>
//<xs:element name="ParentName" type="xs:string" minOccurs="0"/>
//<xs:element name="BirthDate" type="xs:date" minOccurs="0"/>
//<xs:element name="Sex" type="ns:tSex" minOccurs="0"/>
//<xs:element name="AllowProfileView" type="xs:boolean" minOccurs="0"/>