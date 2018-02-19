//
//  Card.h
//  PayApp
//
//  Created by Alexey on 11.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

typedef enum
{
    CardTypeUnknown =               0,
    CardTypeAmex =                  1,
    CardTypeJCB  =                  2,
    CardTypeVisa =                  3,
    CardTypeMasterCard =            4,
    CardTypeDiscover   =            5,
    CardTypeMaestro =               6
    
}CardType;

@interface Card : BaseRequestModel
{
    NSString* isCreditDefault;
    NSString* expiryDateNative;
}


@property (nonatomic, copy) NSString* cardId;
@property (nonatomic, copy) NSString* cardName;
@property (nonatomic, copy) NSString* cardState;
@property (nonatomic, copy) NSString* cardFill;
@property (nonatomic) BOOL creditDefault;

@property (nonatomic, copy) NSString* cardPaySys;
@property (nonatomic, copy) NSString* cardholderName;
@property (nonatomic, copy) NSString* expiryDate;
@property (nonatomic, copy) NSString* pan;
@property (nonatomic, copy) NSString* maskedPan;
@property (nonatomic, copy) NSString* cardCVC2;

-(NSString*)expiryDateNativeValue;

+ (CardType) cardTypeForCardString:(NSString*)cardString;
+ (UIImage*) cardLogoForType:(CardType)cardType;
+ (UIImage*) operationsCardLogoForType:(CardType)cardType;

@end