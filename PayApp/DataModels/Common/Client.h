//
//  Client.h
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"

@interface Client : BaseAnswerModel

@property (nonatomic, copy) NSString* clientId;
@property (nonatomic, copy) NSString* familyName;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* parentName;
@property (nonatomic, copy) NSString* birthDate;
@property (nonatomic, copy) NSString* sex;
@property (nonatomic, copy) NSString* contact;
@property (nonatomic, copy) NSString* isNeedRegisterFin;
@property (nonatomic)            BOOL needRegisterFin;
@property (nonatomic,copy)   UIImage* userPhoto;
@end


//<xs:element name="ClientId" type="xs:string"/>
//<xs:element name="FamilyName" type="xs:string" minOccurs="0"/>
//<xs:element name="Name" type="xs:string" minOccurs="0"/>
//<xs:element name="ParentName" type="xs:string" minOccurs="0"/>
//<xs:element name="BirthDate" type="xs:date" minOccurs="0"/>
//<xs:element name="Sex" type="ns:tSex" minOccurs="0"/>
//<xs:element name="Contact" type="xs:string" minOccurs="0"/>
//<xs:element name="NeedRegisterFin" type="xs:boolean">