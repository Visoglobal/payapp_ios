//
//  MoneySendAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"
#import "ToDo.h"
#import "Verify.h"

@interface MoneySendAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, retain) ToDo* toDo;

@property (nonatomic, copy) NSString* transactionId;
@property (nonatomic, copy) NSString* transactionState;
@property (nonatomic, copy) NSString* expiryDate;
@property (nonatomic, retain) Verify* verify;

@end

//<xs:element name="MoneySendRs">
//<xs:complexType>
//<xs:complexContent>
//<xs:extension base="ns:tRs">
//<xs:sequence>
//<xs:element name="TrId" type="xs:string"/>
//<xs:element name="TrState" type="ns:tTrState"/>
//<xs:element name="ExpiryDate" type="xs:dateTime"/>
//<xs:element name="Verify" type="ns:tVerify"/>
//</xs:sequence>
//</xs:extension>
//</xs:complexContent>
//</xs:complexType>
//</xs:element>
//
//<xs:complexType name="tVerify">
//<xs:sequence>
//<xs:element name="ACSURL" type="xs:string"/>
//<xs:element name="PaReq" type="xs:string"/>
//<xs:element name="TermUrl" type="xs:string"/>
//<xs:element name="MD" type="xs:string"/>
//</xs:sequence>
//</xs:complexType>