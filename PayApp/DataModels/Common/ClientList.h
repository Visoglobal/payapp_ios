//
//  ClientList.h
//  PayApp
//
//  Created by Alexey on 18.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClientList : NSArray

+ (id)classWithArray:(NSArray *)data;
+ (id)classWithProperties:(NSDictionary *)properties;

@end
