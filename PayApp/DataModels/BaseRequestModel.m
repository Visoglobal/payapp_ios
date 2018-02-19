//
//  BaseRequestModel.m
//  
//
//  Created by Alexey on 21.10.15.
//
//

#import "BaseRequestModel.h"

@implementation BaseRequestModel


-(NSArray*) attributes
{
    @throw [NSException exceptionWithName:@"NotImplementedException"
                                   reason:[NSString stringWithFormat:@"Method 'mapProperties' should be overriden in class '%@'.", [[self class] description]] userInfo:nil];
}

-(NSArray*) parameters
{
    NSMutableArray* params = [NSMutableArray new];
    CHOrderedDictionary *classKeys = self.mapProperties;
    
    for (NSString *key in classKeys.allKeys)
    {
        NSString *objectProperty = classKeys[key];
        NSString *value = [self valueForKey:objectProperty];
        if (value)
        {
            ClassParameter* param = [[ClassParameter alloc] initWithParamName:key andValue:value?value:@""];
            [params addObject:param];
        }
    }
    return params;
}

- (NSString*) contentType
{
    return @"text/xml";
}

@end
