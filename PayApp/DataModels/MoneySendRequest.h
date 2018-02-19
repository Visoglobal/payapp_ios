//
//  MoneySendRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "Sender.h"
#import "Receiver.h"

@interface MoneySendRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;

@property (nonatomic, retain) Sender*   sender;
@property (nonatomic, retain) Receiver* receiver;

@property (nonatomic, copy) NSString* amount;
@property (nonatomic, copy) NSString* currency;
@property (nonatomic, copy) NSString* expiryDate;
@property (nonatomic, copy) NSString* comment;
@property (nonatomic, copy) NSString* allowViewComment;
@property (nonatomic, copy) NSString* phone;
@property (nonatomic, copy) NSString* email;

@end

//<xs:extension base="ns:tRq">
//<xs:element name="Sender">
//<xs:element name="Receiver">
//<xs:element name="Amount" type="xs:unsignedInt">
//<xs:documentation>Сумма в минимальных единицах (в копейках)</xs:documentation>
//<xs:documentation>Сумма в минимальных единицах (в копейках)</xs:documentation>
//<xs:element name="Currency" type="ns:tCurrency"/>
//<xs:element name="ExpiryDate" type="xs:dateTime" minOccurs="0"/>
//<xs:element name="Comment" type="xs:string" minOccurs="0"/>
//<xs:element name="AllowViewComment" type="xs:boolean" minOccurs="0"/>
//<xs:element name="Phone" type="xs:string" minOccurs="0"/>
//<xs:element name="Email" type="xs:string" minOccurs="0"/>
