//
//  MoneyAcceptReceiveAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"
#import "ToDo.h"

@interface MoneyAcceptReceiveAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, retain) ToDo* toDo;

@property (nonatomic, copy) NSString* transactionId;
@property (nonatomic, copy) NSString* transactionState;
@property (nonatomic, copy) NSString* expiryDate;

@end
