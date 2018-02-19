//
//  BaseDataModel.m
//  PayApp
//
//  Created by Alexey on 14.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "BaseRequestDataModel.h"
#import <objc/runtime.h>

@implementation BaseRequestDataModel

- (NSDictionary*)dictionaryFromClass {
    
    Class contactClass = [self class];
    u_int count;
    
    objc_property_t *properties = class_copyPropertyList(contactClass, &count);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:count];
    
    for (int i = 0; i<count; i++) {
        NSString *str = [NSString stringWithCString:property_getName(properties[i])
                                           encoding:NSUTF8StringEncoding];
        
        //Set the dicationary values from our properties
        [dict setValue:[self valueForKey:str] forKey:str];
    }
    free(properties);
    
    NSMutableDictionary *classDict = [[NSMutableDictionary alloc] init];
    [classDict setObject:dict forKey:[self rootName]];
    
    return dict;
}

@end
