//
//  HttpRequestSOAPXMLResponceSerializer.m
//  
//
//  Created by Alexey on 23.10.15.
//
//

#import "HttpRequestSOAPXMLResponceSerializer.h"
#import <HttpRequestLib/XMLDictionary/XMLDictionary.h>
#import "TBXML.h"
#import "Soap.h"

@implementation HttpRequestSOAPXMLResponceSerializer

- (void)parseData:(NSData*)data withCommpletion:(void (^)(id responseObject,NSError * error))complete
{
//    NSString* asd = @"3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d227574662d3822203f3e3c534f41502d454e563a456e76656c6f706520786d6c6e733a534f41502d454e563d22687474703a2f2f736368656d61732e786d6c736f61702e6f72672f736f61702f656e76656c6f70652f223e3c534f41502d454e563a4865616465722f3e3c534f41502d454e563a426f64793e3c6e73323a4170704c6f67696e527320786d6c6e733a6e73323d22687474703a2f2f7777772e6d3462616e6b2e72752f503250223e3c6e73323a527149643e313c2f6e73323a527149643e3c6e73323a536572766572446174653e323031362d30342d32305431323a33383a30342e3337342b30333a30303c2f6e73323a536572766572446174653e3c6e73323a546f446f3e3c6e73323a416c6c6f7746696e616e63653e747275653c2f6e73323a416c6c6f7746696e616e63653e3c2f6e73323a546f446f3e3c6e73323a53657373696f6e49643e656c62646c666e3935464f663c2f6e73323a53657373696f6e49643e3c6e73323a4c6f67696e506172616d733e3c6e73323a4665653e302e303c2f6e73323a4665653e3c6e73323a4d696e4665653e303c2f6e73323a4d696e4665653e3c6e73323a43757272656e63793e5255423c2f6e73323a43757272656e63793e3c2f6e73323a4c6f67696e506172616d733e3c2f6e73323a4170704c6f67696e52733e3c2f534f41502d454e563a426f64793e3c2f534f41502d454e563a456e76656c6f70653e";
//    NSData* asdA = [self dataFromHexString:asd];
//    NSString* asdB = [NSString stringWithUTF8String:[asdA bytes]];
//    NSString* asdC = [[NSString alloc] initWithData:asdA encoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
//    NSString* answerString = [NSString stringWithUTF8String:[data bytes]]; //somtimes return nill when data not nill
    NSString* answerString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]; //work correctly allways
    NSLog(@"answer--> %@",answerString);
    
    NSDictionary* answerObj = [Soap objectFromXMLString:answerString];

    NSDictionary* body = answerObj?[answerObj objectForKey:@"Envelope"]:nil;
    body = body?[body objectForKey:@"Body"]:nil;
    body = body?body:answerObj;
    
    if(complete)
        complete(body,error);
}

-(NSDictionary*)getDictionaryFromNsDate:(NSData *)data
{
    NSDictionary* answerDict = [NSDictionary dictionaryWithXMLData:data];
    return answerDict;
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[[self class] alloc] init];
}

- (NSData *) dataFromHexString:(NSString*)hexString
{
    NSString * cleanString = [self cleanNonHexCharsFromHexString:hexString];
    if (cleanString == nil) {
        return nil;
    }
    
    NSMutableData *result = [[NSMutableData alloc] init];
    
    int i = 0;
    for (i = 0; i+2 <= cleanString.length; i+=2) {
        NSRange range = NSMakeRange(i, 2);
        NSString* hexStr = [cleanString substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        unsigned char uc = (unsigned char) intValue;
        [result appendBytes:&uc length:1];
    }
    NSData * data = [NSData dataWithData:result];

    return data;
}

- (NSString *) cleanNonHexCharsFromHexString:(NSString *)input
{
    if (input == nil) {
        return nil;
    }
    
    NSString * output = [input stringByReplacingOccurrencesOfString:@"0x" withString:@""
                                                            options:NSCaseInsensitiveSearch range:NSMakeRange(0, input.length)];
    NSString * hexChars = @"0123456789abcdefABCDEF";
    NSCharacterSet *hexc = [NSCharacterSet characterSetWithCharactersInString:hexChars];
    NSCharacterSet *invalidHexc = [hexc invertedSet];
    NSString * allHex = [[output componentsSeparatedByCharactersInSet:invalidHexc] componentsJoinedByString:@""];
    return allHex;
}

@end

