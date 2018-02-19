//
//  CheckLoginArswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"

typedef  NS_ENUM(NSUInteger, RegistrationState){
    RegistrationStateNeedRegisterFin            = 0,
    RegistrationStateNeedContactConfirmation    = 1,
    RegistrationStateNeedConfirmationCode       = 2,
    RegistrationStateCompleted                  = 3
};

@interface CheckLoginArswer : BaseAnswerModel
{
    NSString* isNeedRegister;
    NSString* registrationState;
}

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic) BOOL needRegister;
@property (nonatomic) RegistrationState stateOfRegistration;

@end