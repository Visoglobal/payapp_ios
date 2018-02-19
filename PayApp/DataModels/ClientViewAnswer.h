//
//  ClientViewAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"
#import "ToDo.h"
#import "ContactList.h"
#import "Device.h"

@interface ClientViewAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, retain) ToDo* toDo;

@property (nonatomic, copy) NSString* allowProfileView;
@property (nonatomic, copy) NSString* birthDate;
@property (nonatomic, copy) ContactList* contactList;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* familyName;
@property (nonatomic, copy) NSString* parentName;
@property (nonatomic, copy) NSString* sex;
@property (nonatomic, copy) NSString* clientId;
@property (nonatomic, retain) Device*   device;

@end