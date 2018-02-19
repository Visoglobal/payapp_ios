//
//  CardList.m
//  PayApp
//
//  Created by Alexey on 11.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "CardList.h"
#import "Card.h"

@implementation CardList

+ (id)classWithProperties:(NSDictionary *)properties {
    
    return [[self alloc] initWithProperties:properties];
}

- (id)initWithProperties:(NSDictionary *)properties {
    
    if (self = [self init]) {
        
        if ([properties objectForKey:[self rootName]])
            return [[self class] classWithArray:[properties objectForKey:[self rootName]]];
        else{
            id obj = [properties objectForKey:[[Card new] rootName]];
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
                [transactionsArray addObject:[Card classWithProperties:trans]];
            }
        else
            [transactionsArray addObject:[Card classWithProperties:(NSDictionary*)data]];
    }
    
    return transactionsArray;
}

-(NSString*)rootName
{
    return @"CardList";
}



@end
