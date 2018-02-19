//
//  CardManager.m
//  PayApp
//
//  Created by Alexey on 11.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "CardManager.h"
#import "UserManager.h"
#import "CardListRequest.h"
#import "CardListAnswer.h"
#import "CardRegisterAnswer.h"
#import "CardRegisterRequest.h"
#import "CardEditRequest.h"
#import "CardEditAnswer.h"
#import "Card.h"
#import "PANFormatter.h"


@implementation CardManager


+ (instancetype) sharedCardManager
{
    static CardManager * _sharedCardManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedCardManager = [[CardManager alloc] init];
    });
    
    return _sharedCardManager;
}

- (void) getCardsFromPage:(NSString*)pageNum
                       withState:(NSString*)state
                      withCardId:(NSString*)cardId
                  withCompletion:(void (^)(id cardsAnswer,  NSError *error))completion
{
    CardListRequest* transactiosRqst = [CardListRequest new];
    transactiosRqst.requestId = @"1";
    transactiosRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    transactiosRqst.sessionId = USER_MANAGER.sessionId;
    transactiosRqst.page = pageNum;
    transactiosRqst.cardState = state;
    transactiosRqst.cardId = cardId;
    
    [requestManager sendRequest:transactiosRqst complete:^(id responseObject, NSError *error) {
        CardListAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[CardListAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            self.cardList = [NSMutableArray arrayWithArray:answer.cardList];
            NSString* userDefautCard = [self getDafaultCardTypeAndMaskedPanFromCardsList:self.cardList];
            if (userDefautCard)
                USER_MANAGER.userDefaultCardNum = userDefautCard;
            else
                USER_MANAGER.userDefaultCardNum = @"";
        }
        
        if (completion)
            completion(answer, error);
    }];
}

-(NSString*)getDafaultCardTypeAndMaskedPanFromCardsList:(NSArray*)cardsList
{
    if (!cardsList || cardsList.count == 0)
        return nil;
    for (Card* card in cardsList) {
        if (card.creditDefault){
            return [NSString stringWithFormat:@"%@ %@",card.cardPaySys,card.maskedPan];
        }
    }
    return nil;
}

- (void) registerNewCardWithName:(NSString*)cardName
                  withCardPaySys:(NSString*)cardPaySys
                         withPan:(NSString*)pan
                  withExpiryDate:(NSString*)expiryDate
              withCardholderName:(NSString*)cardholderName
                        withCvc2:(NSString*)cvc2
               withCreditDefault:(NSString*)creditDefault
                  withCompletion:(void (^)(id cardsAnswer,  NSError *error))completion
{
    CardRegisterRequest* newCardRqst = [CardRegisterRequest new];
    newCardRqst.requestId = @"1";
    newCardRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    newCardRqst.sessionId = USER_MANAGER.sessionId;
    
    newCardRqst.cardName = cardName;
    newCardRqst.cardPaySys = cardPaySys;
    newCardRqst.pan = pan;
    newCardRqst.expiryDate = expiryDate;
    newCardRqst.cardholderName = cardholderName;
    newCardRqst.cvc2 = cvc2;
    newCardRqst.creditDefault = creditDefault;
    
    [requestManager sendRequest:newCardRqst complete:^(id responseObject, NSError *error) {
        CardRegisterAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[CardRegisterAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];

            if (!error && answer && creditDefault)
            {
                PANFormatter * panFormatter = [PANFormatter maskedLastFourNumberPanFormatter];
                NSString * lastFourNumberMaskedPan = [panFormatter stringFromPAN:pan];
                USER_MANAGER.userDefaultCardNum = [NSString stringWithFormat:@"%@ %@",cardPaySys,lastFourNumberMaskedPan];
            }
        }
        
        if (completion)
            completion(answer, error);
    }];
}

- (void) editCardWithName:(NSString*)cardName
                cardState:(NSString*)cardState
                   cardId:(NSString*)cardId
        withCreditDefault:(NSString*)creditDefault
           withExpiryDate:(NSString*)expiryDate
       withCardholderName:(NSString*)cardholderName
                 withCvc2:(NSString*)cvc2
           withCompletion:(void (^)(id cardsAnswer,  NSError *error))completion
{
    CardEditRequest* newCardRqst = [CardEditRequest new];
    newCardRqst.requestId = @"1";
    newCardRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    newCardRqst.sessionId = USER_MANAGER.sessionId;
    
    newCardRqst.cardId = cardId;
    newCardRqst.cardName = cardName;
    newCardRqst.cardState = cardState;
    newCardRqst.expiryDate = expiryDate;
    newCardRqst.cardholderName = cardholderName;
    newCardRqst.cvc2 = cvc2;
    newCardRqst.creditDefault = creditDefault;
    
    [requestManager sendRequest:newCardRqst complete:^(id responseObject, NSError *error) {
        CardEditAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[CardEditAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            
            if (!error && answer && creditDefault)
            {
                Card* card = [self getCardForCardId:cardId fromCardsList:self.cardList];
                if (card){
                    USER_MANAGER.userDefaultCardNum = [NSString stringWithFormat:@"%@ %@",card.cardPaySys,card.maskedPan];
                }
            }
        }
        
        if (completion)
            completion(answer, error);
    }];
}

-(Card*)getCardForCardId:(NSString*)cardId fromCardsList:(NSArray*)cardList
{
    if (cardList || cardList.count == 0)
        return nil;
    
    for (Card* card in cardList) {
        if ([card.cardId isEqualToString:cardId]){
            return card;
        }
    }
    
    return nil;
}
@end
