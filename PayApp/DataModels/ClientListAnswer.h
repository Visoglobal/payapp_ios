//
//  ClientListAnswer.h
//  PayApp
//
//  Created by Alexey on 18.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"
#import "ToDo.h"
#import "ClientList.h"

@interface ClientListAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, retain) ToDo* toDo;
@property (nonatomic, copy) ClientList* clientList;

@end
