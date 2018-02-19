//
//  ClientInviteAnswer.h
//  PayApp
//
//  Created by Alexey on 04.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"
#import "ToDo.h"

@interface ClientInviteAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, retain) ToDo* toDo;
@property (nonatomic, copy) NSString* verifyExpiryDate;

@end
