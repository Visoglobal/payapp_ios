//
//  HttpRequestResponseAnalizator.m
//  
//
//  Created by Alexey on 20.10.15.
//
//

#import "HttpRequestResponseAnalizer.h"

@implementation HttpRequestResponseAnalizer
@synthesize operationResult;


- (void) constructHandlerWithResponseDictionary:(NSDictionary*)responseDictionary
{
    operationResult = RequestOperationResultSuccess;
    
    if (!responseDictionary || [responseDictionary allKeys].count != 1)
    {
        operationResult = RequestOperationResultError;
        return;
    }
    
    NSDictionary* root = [responseDictionary allValues].count > 0? [[responseDictionary allValues] objectAtIndex:0]:[NSDictionary new];
    NSString* rootName = [root objectForKey:kElementName];
    NSArray* rootChildren = [root objectForKey:kElementChildren];

    if (!rootName || !rootChildren)
    {
        operationResult = RequestOperationResultError;
        return;
    }

    NSDictionary* body = (NSDictionary*)[[self class] getXmlNodeValue:root isHead:YES];
    
    NSArray * bodyKeys = body?[body allKeys]:[NSArray new];
    int resultCode  = 99;
    
    if (bodyKeys.count)
    {

        NSString * firstKey = [bodyKeys objectAtIndex:0];
        
        NSString * resCodeStr = [[body objectForKey:firstKey] objectForKey:@"ResultCode"];
        
        if (resCodeStr){
            NSString *clearedResCode = [[resCodeStr componentsSeparatedByCharactersInSet:
                                         [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                                        componentsJoinedByString:@""];
            resultCode = [clearedResCode intValue];
        }
    }
    
    if (resultCode != 0)
        operationResult = RequestOperationResultError;
    if (resultCode == 22)
        operationResult = RequestOperationResultNeedRepeate;
}

+ (NSObject*) getXmlNodeValue:(NSDictionary*)xmlNode isHead:(BOOL)isHead
{
    NSObject* value = nil;
    NSArray* xmlNodeChildren = [xmlNode objectForKey:kElementChildren];
    
    if (xmlNodeChildren && xmlNodeChildren.count > 0)
    {
        NSMutableDictionary* nodeChildren = [NSMutableDictionary dictionaryWithCapacity:1];
        
        for (NSDictionary* child in xmlNodeChildren)
        {
            NSString* childName = [child objectForKey:kElementName];
            NSObject* childValue = [self getXmlNodeValue:child isHead:NO];
            NSObject* childItem = [nodeChildren objectForKey:childName];
            
            NSDictionary* childAttribues = [child objectForKey:kElementAttibutes];
            
            // add atributes as a value-name
            childValue = [self attributedValueFromDict:childAttribues childValue:childValue childName:childName];
            
            if (childItem != nil)
            {
                if ([childItem isKindOfClass:[NSMutableArray class]])
                {
                    [(NSMutableArray*)childItem addObject:childValue];
                }
                else
                    [nodeChildren setValue:[NSMutableArray arrayWithObjects:childItem, childValue, nil] forKey:childName];
            }
            else // childItem == nil
            {
                [nodeChildren setValue:childValue forKey:childName];
            }
        }
        
        value = nodeChildren;
    }
    else
        value = [xmlNode objectForKey:kElementValue];
    
    if (!isHead)
        return value;
    
    NSMutableDictionary* elementValue = [NSMutableDictionary dictionary];
    
    if (value)
        [elementValue setObject:value forKey:[xmlNode objectForKey:kElementName]];
    
    return elementValue;
}

+ (NSObject*) attributedValueFromDict:(NSDictionary*)attributesDict childValue:(NSObject*)childValue childName:(NSString*)childName
{
    if (attributesDict.allKeys.count)
    {
        if (childValue)
        {
            if ([childValue isKindOfClass:[NSMutableDictionary class]])
                [(NSMutableDictionary*)childValue addEntriesFromDictionary:attributesDict];
            else
            {
                childValue = [NSMutableDictionary dictionaryWithObject:childValue forKey:childName];
                [(NSMutableDictionary*)childValue addEntriesFromDictionary:attributesDict];
            }
        }
        else
            childValue = attributesDict;
    }
    
    return childValue;
}



@end
