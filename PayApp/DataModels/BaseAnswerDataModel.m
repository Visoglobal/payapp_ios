//
//  BaseAnswerDataModel.m
//  PayApp
//
//  Created by Alexey on 14.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "BaseAnswerDataModel.h"
#import <objc/runtime.h>

@implementation BaseAnswerDataModel

+ (id)classWithProperties:(NSDictionary *)properties {
    
    return [[self alloc] initWithProperties:properties];
}

- (id)initWithProperties:(NSDictionary *)properties {
    
    if (self = [self init]) {
        
        if ([properties objectForKey:[self rootName]])
                    [self setValuesForKeysWithDictionary:[properties objectForKey:[self rootName]]];
        else
            [self setValuesForKeysWithDictionary:properties];
    }
    return self;
}

-(void)  setValuesForKeysWithDictionary:(NSDictionary*)dict{
    
    for (NSString* prop in [self allPropertyNames]) {
        if ([dict objectForKey:prop])
         [self setValue:[dict objectForKey:prop] forKey:prop];
    }
}

- (NSArray *)allPropertyNames
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    
    free(properties);
    
    return rv;
}



- (NSString*)rootName
{
    @throw [NSException exceptionWithName:@"NotImplementedException"
                                   reason:[NSString stringWithFormat:@"Method 'rootName' should be overriden in class '%@'.", [[self class] description]] userInfo:nil];
}

@end
