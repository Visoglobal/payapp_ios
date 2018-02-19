//
//  HttpResponceXMLSerializer.h
//  MobileAcquiringCore
//
//  Created by Alexey on 17.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ResponceSerializerProtocol

-(NSDictionary*) getDictionaryFromNsDate:(NSData*)data;
-(void) parseData:(NSData*)data withCommpletion:(void (^)(id responseObject,NSError * error))complete;

@end
