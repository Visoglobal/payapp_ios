//
//  ContactList.m
//  PayApp
//
//  Created by Alexey on 14.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

+ (id)classWithProperties:(NSDictionary *)properties {
    
    return [[self alloc] initWithProperties:properties];
}

- (id)initWithProperties:(NSDictionary *)properties {
    
    if (self = [self init]) {
        
        if ([properties objectForKey:[self rootName]])
            return [[self class] classWithArray:[properties objectForKey:[self rootName]]];
        else{
            id obj = [properties objectForKey:[[Contact new] rootName]];
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
                [transactionsArray addObject:[Contact classWithProperties:trans]];
            }
        else
            [transactionsArray addObject:[Contact classWithProperties:(NSDictionary*)data]];
    }
    
    return transactionsArray;
}

-(NSString*)rootName
{
    return @"ContactList";
}




@end
