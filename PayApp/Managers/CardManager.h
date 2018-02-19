//
//  CardManager.h
//  PayApp
//
//  Created by Alexey on 11.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"

#define CARD_MANAGER [CardManager sharedCardManager]

@interface CardManager : BaseManager

@property (nonatomic, copy) NSMutableArray* cardList;

+ (instancetype) sharedCardManager;

-(NSString*)getDafaultCardTypeAndMaskedPanFromCardsList:(NSArray*)cardsList;

- (void) getCardsFromPage:(NSString*)pageNum
                       withState:(NSString*)state
                      withCardId:(NSString*)cardId
                  withCompletion:(void (^)(id cardsAnswer,  NSError *error))completion;

- (void) registerNewCardWithName:(NSString*)cardName
                  withCardPaySys:(NSString*)cardPaySys
                         withPan:(NSString*)pan
                  withExpiryDate:(NSString*)expiryDate
              withCardholderName:(NSString*)cardholderName
                        withCvc2:(NSString*)cvc2
               withCreditDefault:(NSString*)creditDefault
                  withCompletion:(void (^)(id cardsAnswer,  NSError *error))completion;

- (void) editCardWithName:(NSString*)cardName
                cardState:(NSString*)cardState
                   cardId:(NSString*)cardId
        withCreditDefault:(NSString*)creditDefault
           withExpiryDate:(NSString*)expiryDate
       withCardholderName:(NSString*)cardholderName
                 withCvc2:(NSString*)cvc2
           withCompletion:(void (^)(id cardsAnswer,  NSError *error))completion;
@end
