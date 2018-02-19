//
//  BaseAnswerModel.m
//  PayApp
//
//  Created by Alexey on 12.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "BaseAnswerModel.h"
#import <objc/runtime.h>

@implementation BaseAnswerModel

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
    
    NSDictionary *classKeys = self.mapProperties;
    NSDictionary *classClasses = self.mapClasses;
    
    for (NSString *key in classKeys.allKeys) {
        NSString *objectProperty = classKeys[key];
        NSString *value = dict[key];
        if (value)
        {
            id klass = classClasses[key];
            if (!klass) {
                [self setValue:value forKey:objectProperty];
            } else {
                [self setValue:[klass classWithProperties:(NSDictionary*)value] forKey:objectProperty];
                
            }
        }
    }
}

- (CHOrderedDictionary*) mapProperties
{
    @throw [NSException exceptionWithName:@"NotImplementedException"
                                   reason:[NSString stringWithFormat:@"Method 'mapProperties' should be overriden in class '%@'.", [[self class] description]] userInfo:nil];
}

- (CHOrderedDictionary *)mapClasses
{
    @throw [NSException exceptionWithName:@"NotImplementedException"
                                   reason:[NSString stringWithFormat:@"Method 'mapClasses' should be overriden in class '%@'.", [[self class] description]] userInfo:nil];
}

- (NSString*)rootName
{
    @throw [NSException exceptionWithName:@"NotImplementedException"
                                   reason:[NSString stringWithFormat:@"Method 'rootName' should be overriden in class '%@'.", [[self class] description]] userInfo:nil];
}

@end
