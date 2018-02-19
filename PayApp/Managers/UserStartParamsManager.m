//
//  UserStartParamsManager.m
//  PayApp
//
//  Created by Alexey on 04.04.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "UserStartParamsManager.h"
#import "UpdateManager.h"
#import "CardManager.h"

@implementation UserStartParamsManager

+ (instancetype) sharedUserStartParamsManager
{
    static UserStartParamsManager * _sharedUserStartParamsManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedUserStartParamsManager = [[UserStartParamsManager alloc] init];
    });
    
    return _sharedUserStartParamsManager;
}

- (void) updateUserInitDataWithCompletion:(void (^)(NSError *error))completion
{
    [UPDATE_MANAGER updateAppBaseDataWithCompletion:^{
        [CARD_MANAGER getCardsFromPage:@"0" withState:nil withCardId:nil withCompletion:^(id cardsAnswer, NSError *error) {
            if (completion)
                completion(nil);
        }];
    }];
}

@end
