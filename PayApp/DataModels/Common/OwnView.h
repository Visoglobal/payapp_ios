//
//  OwnView.h
//  PayApp
//
//  Created by Alexey on 08.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"

@interface OwnView : BaseAnswerModel

@property (nonatomic, copy) NSString* cardId;
@property (nonatomic, copy) NSString* cardName;
@property (nonatomic, copy) NSString* maskedPAN;
@property (nonatomic, copy) NSString* approvalCode;
@property (nonatomic, copy) NSString* amount;
@property (nonatomic, copy) NSString* feeAmount;
@property (nonatomic, copy) NSString* currency;

@end

//<xs:element name="Own">
//<xs:complexType>
//<xs:sequence>
//<xs:element name="CardId" type="xs:string"
//minOccurs="0"/>
//<xs:element name="CardName" type="xs:string"
//minOccurs="0"/>
//<xs:element name="MaskedPAN"
//type="xs:string" minOccurs="0"/>
//<xs:element name="ApprovalCode"
//type="xs:string" minOccurs="0"/>
//<xs:element name="Amount"
//type="xs:unsignedInt">
//<xs:annotation>
//<xs:documentation>Сумма в
//минимальных единицах (в
//копейках)
//</xs:documentation>
//</xs:annotation>
//</xs:element>
//<xs:element name="FeeAmount"
//type="xs:unsignedInt">
//<xs:annotation>
//<xs:documentation>Сумма в
//минимальных единицах (в
//копейках)
//</xs:documentation>
//</xs:annotation>
//</xs:element>
//<xs:element name="Currency"
//type="ns:tCurrency"/>
//</xs:sequence>
//</xs:complexType>
//</xs:element>