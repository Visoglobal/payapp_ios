//
//  ClientList.m
//  PayApp
//
//  Created by Alexey on 18.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ClientList.h"
#import "Client.h"

@implementation ClientList

+ (id)classWithProperties:(NSDictionary *)properties {
    
    return [[self alloc] initWithProperties:properties];
}

- (id)initWithProperties:(NSDictionary *)properties {
    
    if (self = [self init]) {
        
        if ([properties objectForKey:[self rootName]])
            return [[self class] classWithArray:[properties objectForKey:[self rootName]]];
        else{
            id obj = [properties objectForKey:[[Client new] rootName]];
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
                [transactionsArray addObject:[Client classWithProperties:trans]];
            }
        else
            [transactionsArray addObject:[Client classWithProperties:(NSDictionary*)data]];
    }
    
    return transactionsArray;
}

-(NSString*)rootName
{
    return @"ClientList";
}

@end
