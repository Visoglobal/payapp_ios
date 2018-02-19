//
//  CardListRequest.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface CardListRequest : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* localDate;
@property (nonatomic, copy) NSString* sessionId;
@property (nonatomic, copy) NSString* page;
@property (nonatomic, copy) NSString* cardId;
@property (nonatomic, copy) NSString* cardState;

@end


//<xs:extension base="ns:tRq">
//<xs:sequence>
//<xs:element name="Page" type="xs:unsignedInt"/>
//<xs:element name="CardId" type="xs:string" minOccurs="0"/>
//<xs:element name="CardState" type="ns:tCardState" minOccurs="0"/>