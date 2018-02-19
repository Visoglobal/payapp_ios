//
//  TransactionFilterData.h
//  PayApp
//
//  Created by Alexey on 02.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionFilterData : NSObject

@property (nonatomic, copy) NSString* transactionType;
@property (nonatomic, copy) NSString* dateFrom;
@property (nonatomic, copy) NSString* dateTo;
@property (nonatomic, copy) NSString* cardId;

@end
