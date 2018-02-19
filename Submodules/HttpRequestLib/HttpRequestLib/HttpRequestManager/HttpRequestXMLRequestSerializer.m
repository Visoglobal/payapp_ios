//
//  HttpRequestXMLRequestSerializer.m
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import "HttpRequestXMLRequestSerializer.h"
#import "XMLDictionary.h"
#import "NSString+Formatting.h"

@implementation HttpRequestXMLRequestSerializer

-(NSData*) getNSDataFromNSDictionary:(NSDictionary *)dictionary{


    if  (!dictionary)
        return nil;
    NSString *xmlString = [dictionary XMLString];
    
    return [xmlString dataUsingEncoding:NSUTF8StringEncoding];

}

-(NSData*) getNSDataFromXMLString:(NSString *)xmlString{
    
    
    if  (!xmlString)
        return nil;

    return [xmlString dataUsingEncoding:NSUTF8StringEncoding];
    
}

-(NSString*) buildXMLStringWithOperationString:(NSString*)operationString messageType:(NSString*)messageType messageNum:(NSString*)messageNum andParameters:(NSArray*)parameters{
   
    NSMutableString * requestString = [NSMutableString string];
    
    [requestString appendString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
    [requestString appendFormat:@"<%@ MsgType=\"%@\" MsgNum=\"%@\">", operationString, messageType, messageNum];
    
    for (NSDictionary * oneParam in parameters)
    {
        NSString * tag = [[oneParam allKeys] objectAtIndex:0];
        NSString * value = [oneParam objectForKey:tag];
        
        [requestString appendString:[self xmlTagForKey:tag value:value attributesDict:nil]];
    }
    
    [requestString appendFormat:@"</%@>", operationString];
    
    return [requestString stringByRemovingControlCharacters];
}

- (NSString*) xmlTagForKey:(NSString*)key value:(NSString*)value attributesDict:(NSDictionary*)attrDict
{
    NSMutableString * attributes = [NSMutableString stringWithString:@""];
    
    if (attrDict.allKeys.count)
    {
        for (NSString * oneKey in attrDict.allKeys)
        {
            [attributes appendString:@" "];
            [attributes appendFormat:@"%@=\"%@\"", oneKey, [attrDict objectForKey:oneKey]];
        }
    }
    
    return [NSMutableString stringWithFormat:@"<%@%@>%@</%@>", key, attributes, value, key];
}

@end
