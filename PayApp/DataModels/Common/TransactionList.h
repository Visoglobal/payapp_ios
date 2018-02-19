//
//  TransactionList.h
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionList : NSArray

+ (id)classWithArray:(NSArray *)data;
+ (id)classWithProperties:(NSDictionary *)properties;

@end
