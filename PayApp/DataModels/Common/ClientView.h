//
//  ClientView.h
//  PayApp
//
//  Created by Alexey on 08.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactList.h"
#import "BaseAnswerModel.h"

@interface ClientView : BaseAnswerModel

@property (nonatomic, copy) NSString* clientId;
@property (nonatomic, copy) NSString* familyName;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* parentName;
@property (nonatomic, copy) NSString* birthDate;
@property (nonatomic, copy) NSString* sex;
@property (nonatomic, copy) ContactList* contactList;
@property (nonatomic, copy) NSString* needRegisterFin;

@end

//<xs:complexType name="tClientView">
//<xs:sequence>
//<xs:element name="ClientId" type="xs:string"/>
//<xs:element name="FamilyName" type="xs:string" minOccurs="0"/>
//<xs:element name="Name" type="xs:string" minOccurs="0"/>
//<xs:element name="ParentName" type="xs:string" minOccurs="0"/>
//<xs:element name="BirthDate" type="xs:date" minOccurs="0"/>
//<xs:element name="Sex" type="ns:tSex" minOccurs="0"/>
//<xs:element name="ContactList" minOccurs="0">
//<xs:complexType>
//<xs:sequence>
//<xs:element name="Contact" maxOccurs="unbounded">
//<xs:complexType>
//<xs:sequence>
//<xs:choice>
//<xs:element name="Phone" type="xs:string"/>
//<xs:element name="Email" type="xs:string"/>
//</xs:choice>
//</xs:sequence>
//</xs:complexType>
//</xs:element>
//</xs:sequence>
//</xs:complexType>
//</xs:element>
//<xs:element name="NeedRegisterFin" type="xs:boolean">
//<xs:annotation>
//<xs:documentation>логин валиден, но требуется завершение регистрации клиента</xs:documentation>
//</xs:annotation>
//</xs:element>
//</xs:sequence>
//</xs:complexType>