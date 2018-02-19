//
//  BaseAnswerModel.h
//  PayApp
//
//  Created by Alexey on 12.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHOrderedDictionary.h"

@interface BaseAnswerModel : NSObject

+ (id)classWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

- (NSString*)rootName;

//CHOrderedDictionary here is needed coz SOAP tag ordering is required
- (CHOrderedDictionary*) mapProperties;
- (CHOrderedDictionary*) mapClasses;

@end
