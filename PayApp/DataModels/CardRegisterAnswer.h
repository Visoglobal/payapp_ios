//
//  CardRegisterAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"
#import "ToDo.h"

@interface CardRegisterAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, retain) ToDo* toDo;

@property (nonatomic, copy) NSString* cardId;
@property (nonatomic, copy) NSString* cardName;
@property (nonatomic, copy) NSString* cardState;
@property (nonatomic, copy) NSString* cardFill;

@end

//<xs:element name="CardId" type="xs:string"/>
//<xs:element name="CardName" type="xs:string"/>
//<xs:element name="CardState" type="ns:tCardState"/>
//<xs:element name="CardFill" type="ns:tCardFill"/>