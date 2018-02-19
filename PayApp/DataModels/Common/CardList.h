//
//  CardList.h
//  PayApp
//
//  Created by Alexey on 11.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardList : NSArray

+ (id)classWithArray:(NSArray *)data;
+ (id)classWithProperties:(NSDictionary *)properties;

@end
