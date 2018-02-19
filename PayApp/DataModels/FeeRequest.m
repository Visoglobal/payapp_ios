//
//  WebFeeRequest.m
//  PayApp
//
//  Created by Alexey on 20.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "FeeRequest.h"

@implementation FeeRequest

-(NSString*)rootName
{
    return @"FeeRq";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"localDate",
                                                        @"sessionId",
                                                        @"senderInfo",
                                                        @"receiverInfo",
                                                        @"amount"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"LocalDate",
                                                                      @"SessionId",
                                                                      @"SenderInfo",
                                                                      @"ReceiverInfo",
                                                                      @"Amount"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"SenderInfo": [SenderInfo class],
                                   @"ReceiverInfo": [ReceiverInfo class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}

@end

//<xs:extension base="ns:tRq">
//<xs:sequence>
//<xs:element name="SenderInfo">
//<xs:complexType>
//<xs:choice>
//<xs:element name="CardId" type="xs:string"/>
//<xs:element name="PAN" type="xs:string"/>
//</xs:choice>
//</xs:complexType>
//</xs:element>
//<xs:element name="ReceiverInfo">
//<xs:complexType>
//<xs:choice>
//<xs:element name="ClientId" type="xs:string"/>
//<xs:element name="Contact" type="xs:string"/>
//<xs:element name="CardId" type="xs:string"/>
//<xs:element name="PAN" type="xs:string"/>
//</xs:choice>
//</xs:complexType>
//</xs:element>
//<xs:element name="Amount" type="xs:unsignedInt">
//<xs:annotation>
//<xs:documentation>Сумма в минимальных единицах (в копейках)</xs:documentation>
//</xs:annotation>
//</xs:element>
//</xs:sequence>
//</xs:extension>