//
//  HttpRequestXMLSerializer.h
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestSerializerProtocol

- (NSData*) getNSDataFromNSDictionary:(NSDictionary*)dictionary;
- (NSString*) buildXMLStringWithOperationString:(NSString*)operationString messageType:(NSString*)messageType messageNum:(NSString*)messageNum andParameters:(NSArray*)parameters;
- (NSData*) getNSDataFromXMLString:(NSString *)xmlString;
@end
