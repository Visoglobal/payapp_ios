//
//  LoginAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"
#import "ToDo.h"
#import "LoginParams.h"

@interface LoginAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* version;
@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, copy) NSString* sessionId;

@property (nonatomic, retain)   ToDo* toDo;
@property (nonatomic, retain)   LoginParams* loginParams;

@end
