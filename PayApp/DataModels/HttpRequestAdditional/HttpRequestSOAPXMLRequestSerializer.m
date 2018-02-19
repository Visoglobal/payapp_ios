//
//  HttpRequestSOAPXMLRequestSerializer.m
//  
//
//  Created by Alexey on 22.10.15.
//
//

#import "HttpRequestSOAPXMLRequestSerializer.h"
#import "NSString+Formatting.h"
#import "ClassParameter.h"
#import "BaseRequestModel.h"

#define kSoapMethod @"SOAP-ENV"
#define kNameSpace @"http://www.m4bank.ru/P2P"
#define kNamespaceShort @"ns"

@implementation HttpRequestSOAPXMLRequestSerializer


- (NSString*) buildXMLStringWithHttpRequestProtocolObject:(NSObject<HttpRequestProtocol>*)requestObject
{
    
    NSMutableString* requestString = [NSMutableString string];
    [requestString appendString: @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
    [requestString appendFormat: @"<%@:Envelope xmlns:%@=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:%@=\"%@\">",kSoapMethod,kSoapMethod, kNamespaceShort, kNameSpace];
    [requestString appendString:[NSString stringWithFormat:@"<%@:Body>",kSoapMethod]];
    
    [requestString appendString:[NSString stringWithFormat:@"<%@:%@>",kNamespaceShort,[requestObject rootName]]];
    
    if ([requestObject parameters])
        [self constructString:requestString withParamsArray:[requestObject parameters]];
             
    [requestString appendString:[NSString stringWithFormat:@"</%@:%@>",kNamespaceShort,[requestObject rootName]]];
    
    [requestString appendString:[NSString stringWithFormat:@"</%@:Body>", kSoapMethod]];
    [requestString appendString:[NSString stringWithFormat:@"</%@:Envelope>", kSoapMethod]];

    return [requestString stringByRemovingControlCharacters];
}

-(void)constructString:(NSMutableString*)constructedString withParamsArray:(NSArray*)paramsArray
{
    for (ClassParameter* param in paramsArray)
    {
        if (param && param.parameterValue)
        {
            if ([param.parameterValue respondsToSelector:@selector(parameters)])
            {
                BaseRequestModel* classFromParam = (BaseRequestModel*)param.parameterValue;
                if ([classFromParam parameters] && [classFromParam parameters].count>0){
                    [constructedString appendString:[NSString stringWithFormat:@"<%@:%@>",kNamespaceShort,[classFromParam rootName]]];
                    [self constructString:constructedString withParamsArray:[classFromParam parameters]];
                    [constructedString appendString:[NSString stringWithFormat:@"</%@:%@>",kNamespaceShort,[classFromParam rootName]]];
                }
            }else{
                [constructedString appendString:[NSString stringWithFormat:@"<%@:%@>",kNamespaceShort,param.parameterName]];
                [constructedString appendString:param.parameterValue];
                [constructedString appendString:[NSString stringWithFormat:@"</%@:%@>",kNamespaceShort,param.parameterName]];
            }
        }
    }
}

@end
