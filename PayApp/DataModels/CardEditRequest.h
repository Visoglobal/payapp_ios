//
//  CardEditRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface CardEditRequest : BaseRequestModel


@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;

@property (nonatomic, copy) NSString* cardId;
@property (nonatomic, copy) NSString* cardName;
@property (nonatomic, copy) NSString* cardState;
@property (nonatomic, copy) NSString* creditDefault;
@property (nonatomic, copy) NSString* expiryDate;
@property (nonatomic, copy) NSString* cardholderName;
@property (nonatomic, copy) NSString* cvc2;
@end

//<xs:element name="CardId" type="xs:string"/>
//<xs:element name="CardName" type="xs:string" minOccurs="0"/>
//<xs:element name="CardState" type="ns:tCardState" minOccurs="0"/>
//<xs:element name="CreditDefault" type="xs:boolean" minOccurs="0"/>
//<xs:element name="ExpiryDate" type="xs:gYearMonth" minOccurs="0"/>
//<xs:element name="CardholderName" type="xs:date" minOccurs="0"/>
//<xs:element name="CVC2" type="xs:string" minOccurs="0"/>