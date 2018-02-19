//
//  HttpRequestXMLResponceSerializer.m
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import "HttpRequestXMLResponceSerializer.h"
#import "XMLDictionary.h"
#import "ServerResponseXMLParser.h"

@implementation HttpRequestXMLResponceSerializer

- (void)parseData:(NSData*)data withCommpletion:(void (^)(id responseObject,NSError * error))complete
{

    if (xmlParser){
               [xmlParser abort];
               xmlParser = nil;
    }

    _completion = [complete copy];
    
    xmlParser = [[ServerResponseXMLParser alloc] initWithData:data andCommpletion:^(id responseObject, NSError *error) {
                   if (complete){
                           complete( [(ServerResponseXMLParser*)responseObject xmlTree] ,error);
                       }
                }];
}


-(NSDictionary*)getDictionaryFromNsDate:(NSData *)data
{
    NSDictionary* answerDict = [NSDictionary dictionaryWithXMLData:data];
    return answerDict;
}

@end
