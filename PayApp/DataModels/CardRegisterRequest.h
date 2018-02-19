//
//  CardRegisterRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface CardRegisterRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;

@property (nonatomic, copy) NSString* cardName;
@property (nonatomic, copy) NSString* cardPaySys;
@property (nonatomic, copy) NSString* pan;
@property (nonatomic, copy) NSString* expiryDate;
@property (nonatomic, copy) NSString* cardholderName;
@property (nonatomic, copy) NSString* cvc2;
@property (nonatomic, copy) NSString* creditDefault;

@end

//<xs:element name="CardName" type="xs:string" minOccurs="0"/>
//<xs:element name="CardPaySys" type="ns:tPaySysType"/>
//<xs:element name="PAN" type="xs:string"/>
//<xs:element name="ExpiryDate" type="xs:gYearMonth" minOccurs="0"/>
//<xs:element name="CardholderName" type="xs:date" minOccurs="0"/>
//<xs:element name="CVC2" type="xs:string" minOccurs="0"/>
//<xs:element name="CreditDefault" type="xs:boolean"/>