//
//  MoneyAcceptReceiveRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "Receiver.h"

@interface MoneyAcceptReceiveRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;

@property (nonatomic, copy) NSString* transactionId;

@property (nonatomic, retain) Receiver* receiver;

@property (nonatomic, copy) NSString* comment;
@property (nonatomic, copy) NSString* allowViewComment;
@property (nonatomic, copy) NSString* phone;
@property (nonatomic, copy) NSString* email;
@end

//<xs:element name="MoneyAcceptReceiveRq">
//<xs:annotation>
//<xs:documentation>Подтверждение желания получить денежные средства</xs:documentation>
//</xs:annotation>
//<xs:complexType>
//<xs:complexContent>
//<xs:extension base="ns:tRq">
//<xs:sequence>
//<xs:element name="TrId" type="xs:string"/>
//<xs:element name="Receiver">
//<xs:complexType>
//<xs:choice>
//<xs:element name="KnownCard">
//<xs:complexType>
//<xs:sequence>
//<xs:element name="CardId" type="xs:string"/>
//</xs:sequence>
//</xs:complexType>
//</xs:element>
//<xs:element name="NewCard" type="ns:tCard"/>
//</xs:choice>
//</xs:complexType>
//</xs:element>
//<xs:element name="Comment" type="xs:string" minOccurs="0"/>
//<xs:element name="AllowViewComment" type="xs:boolean" minOccurs="0"/>
//<xs:choice>
//<xs:element name="Phone" type="xs:string"/>
//<xs:element name="Email" type="xs:string"/>
//</xs:choice>
//</xs:sequence>
//</xs:extension>
//</xs:complexContent>
//</xs:complexType>