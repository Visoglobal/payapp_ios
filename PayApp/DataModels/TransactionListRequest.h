//
//  TransactionListRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface TransactionListRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;

@property (nonatomic, copy) NSString* sessionId;
@property (nonatomic, copy) NSString* page;
@property (nonatomic, copy) NSString* transactionId;
@property (nonatomic, copy) NSString* dateFrom;
@property (nonatomic, copy) NSString* dateTo;
@property (nonatomic, copy) NSString* cardId;
@property (nonatomic, copy) NSString* transactionState;
@property (nonatomic, copy) NSString* transactionType;
@property (nonatomic, copy) NSString* isNew;
@property (nonatomic, copy) NSString* phone;
@property (nonatomic, copy) NSString* email;

@end

//<xs:element name="TransactionListRq">
//<xs:annotation>
//<xs:documentation>Список транзакций</xs:documentation>
//</xs:annotation>
//<xs:complexType>
//<xs:complexContent>
//<xs:extension base="ns:tRq">
//<xs:sequence>
//<xs:element name="Page" type="xs:unsignedInt"/>
//<xs:element name="TrId" type="xs:string" minOccurs="0"/>
//<xs:element name="DateFrom" type="xs:dateTime" minOccurs="0"/>
//<xs:element name="DateTo" type="xs:dateTime" minOccurs="0"/>
//<xs:element name="CardId" type="xs:string" minOccurs="0"/>
//<xs:element name="TrState" type="ns:tTrState" minOccurs="0"/>
//<xs:element name="TrType" type="ns:tTrType" minOccurs="0"/>
//<xs:element name="IsNew" type="xs:boolean" minOccurs="0"/>
//<xs:element name="Phone" type="xs:string" minOccurs="0"/>
//<xs:element name="Email" type="xs:string" minOccurs="0"/>
//</xs:sequence>
//</xs:extension>
//</xs:complexContent>
//</xs:complexType>
//</xs:element>
