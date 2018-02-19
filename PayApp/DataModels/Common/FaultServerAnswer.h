//
//  FaultServerAnswer.h
//  PayApp
//
//  Created by Alexey on 13.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"

@interface FaultServerAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* detail;
@property (nonatomic, copy) NSString* faultcode;
@property (nonatomic, copy) NSString* faultstring;

-(NSError*)getError;

@end


//detail = "\U0412\U0432\U0435\U0441\U0442\U0438 \U0434\U0430\U043d\U043d\U044b\U0435 \U043f\U043e\U0432\U0442\U043e\U0440\U043d\U043e \U0432 \U043a\U043e\U0440\U0440\U0435\U043a\U0442\U043d\U043e\U043c \U0444\U043e\U0440\U043c\U0430\U0442\U0435";
//faultactor = "M4Bank.P2P.Server";
//faultcode = "SOAP-ENV:31";
//faultstring = "\U041d\U0435\U043a\U043e\U0440\U0440\U0435\U043a\U0442\U043d\U044b\U0439 \U0444\U043e\U0440\U043c\U0430\U0442 \U043a\U043e\U043d\U0442\U0430\U043a\U0442\U043d\U044b\U0445 \U0434\U0430\U043d\U043d\U044b\U0445 \U043a\U043b\U0438\U0435\U043d\U0442\U0430 (\U0442\U0435\U043b\U0435\U0444\U043e\U043d/e-mail)";