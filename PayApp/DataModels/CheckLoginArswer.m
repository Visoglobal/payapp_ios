//
//  CheckLoginArswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "CheckLoginArswer.h"

@implementation CheckLoginArswer

-(BOOL)getNeedRegister
{
    if (isNeedRegister && [isNeedRegister isEqualToString:@"false"])
        return NO;
    
    return YES;
}

-(RegistrationState)stateOfRegistration
{
    if (registrationState && [registrationState length]>0)
    {
        NSInteger item = -1;
        NSArray *states = @[@"need_register_fin", @"need_contact_confirmation", @"need_confirmation_code", @"completed"];
        if (registrationState)
            item = [states indexOfObject:registrationState];
        
        switch (item) {
            case 0:
                return RegistrationStateNeedRegisterFin;
                break;
            case 1:
                return RegistrationStateNeedContactConfirmation;
                break;
            case 2:
                return RegistrationStateNeedConfirmationCode;
                break;
            case 3:
                return RegistrationStateCompleted;
                break;
            default:
                return RegistrationStateCompleted;
                break;
        }

    }
    
    return RegistrationStateCompleted;
}

-(NSString*)rootName
{
    return @"AppCheckLoginRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"isNeedRegister",
                                                        @"registrationState"
                                                        ] forKeys: @[
                                                                     @"RqId",
                                                                     @"ServerDate",
                                                                     @"NeedRegisterFin",
                                                                     @"RegistrationState"
                                                                     ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{};
}



//<AppCheckLoginRs>
//<RqId>str1234</RqId>
//<ServerDate>2012-12-13T12:12:12</ServerDate>
//<NeedRegisterFin>true</NeedRegisterFin>
//</AppCheckLoginRs>
@end
