//
//  BaseAnswerDataModel.h
//  PayApp
//
//  Created by Alexey on 14.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseAnswerDataModel : NSObject

+ (id)classWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;
- (NSString*)rootName;

@end
