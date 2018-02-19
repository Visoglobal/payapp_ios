//
//  Sender.h
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "KnownCard.h"
#import "NewCard.h"

@interface Sender : BaseRequestModel

@property (nonatomic, retain) KnownCard* knownCard;
@property (nonatomic, retain) NewCard*   unknownCard;

@end

//<xs:element name="Sender">
//<xs:complexType>
//<xs:choice>
//<xs:element name="KnownCard" type="ns:tKnownCard"/>
//<xs:element name="NewCard">
//<xs:complexType>
//<xs:complexContent>
//<xs:extension base="ns:tFullCard"/>
//</xs:complexContent>
//</xs:complexType>
//</xs:element>
//</xs:choice>
//</xs:complexType>
//</xs:element>
//
//<xs:complexType name="tKnownCard">
//<xs:sequence>
//<xs:element name="CardId" type="xs:string"/>
//<xs:element name="ExpiryDate" type="xs:gYearMonth" minOccurs="0"/>
//<xs:element name="CardholderName" type="xs:string" minOccurs="0"/>
//<xs:element name="CVC2" type="xs:string" minOccurs="0"/>
//</xs:sequence>
//</xs:complexType>
//
//<xs:complexType name="tFullCard">
//<xs:complexContent>
//<xs:extension base="ns:tCard">
//<xs:sequence>
//<xs:element name="ExpiryDate" type="xs:gYearMonth"/>
//<xs:element name="CardholderName" type="xs:string"/>
//<xs:element name="CVC2" type="xs:string"/>
//</xs:sequence>
//</xs:extension>
//</xs:complexContent>
//</xs:complexType>