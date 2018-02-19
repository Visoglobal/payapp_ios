//
//  TransactionList.m
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "TransactionList.h"
#import "Transaction.h"

@implementation TransactionList

+ (id)classWithProperties:(NSDictionary *)properties {
    
    return [[self alloc] initWithProperties:properties];
}

- (id)initWithProperties:(NSDictionary *)properties {
    
    if (self = [self init]) {
        
        if ([properties objectForKey:[self rootName]])
            return [[self class] classWithArray:[properties objectForKey:[self rootName]]];
        else{
            id obj = [properties objectForKey:[[Transaction new] rootName]];
            if (obj)
                return [[self class] classWithArray:obj];
            else
                return [[self class] classWithArray:(NSArray*)properties];
        }
    }
    return self;
}


+ (id)classWithArray:(NSArray *)data{
    
    NSMutableArray* transactionsArray = [NSMutableArray new];
    
    if(data){
        if ([data isKindOfClass:[NSArray class]])
            for (NSDictionary* trans in data) {
                [transactionsArray addObject:[Transaction classWithProperties:trans]];
            }
        else
            [transactionsArray addObject:[Transaction classWithProperties:(NSDictionary*)data]];
    }

    return transactionsArray;
}

-(NSString*)rootName
{
    return @"TransactionList";
}

@end
