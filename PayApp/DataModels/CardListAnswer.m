//
//  CardListAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CardListAnswer.h"

@implementation CardListAnswer


-(NSString*)rootName
{
    return @"CardListRs";
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"ToDo": [ToDo class],
                                   @"CardList": [CardList class]
                                   };
}


- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"toDo",
                                                        @"cardList"
                                                        ] forKeys:  @[
                                                                      @"RqId",
                                                                      @"ServerDate",
                                                                      @"ToDo",
                                                                      @"CardList"
                                                                      ]];
    
}



-(NSArray*) attributes
{
    return nil;
}


@end

//<xs:element name="CardListRs">
//<xs:complexType>
//<xs:complexContent>
//<xs:extension base="ns:tRs">
//<xs:sequence>
//<xs:element name="CardList" minOccurs="0">
//<xs:complexType>
//<xs:sequence>
//<xs:element name="Card" maxOccurs="unbounded">
//<xs:complexType>
//<xs:sequence>
//<xs:element name="CardId" type="xs:string"/>
//<xs:element name="CardName" type="xs:string"/>
//<xs:element name="CardState" type="ns:tCardState"/>
//<xs:element name="CardFill" type="ns:tCardFill"/>
//<xs:element name="CreditDefault" type="xs:boolean"/>
//</xs:sequence>
//</xs:complexType>
//</xs:element>
//</xs:sequence>
//</xs:complexType>
//</xs:element>
//</xs:sequence>
//</xs:extension>
//</xs:complexContent>
//</xs:complexType>
//</xs:element>