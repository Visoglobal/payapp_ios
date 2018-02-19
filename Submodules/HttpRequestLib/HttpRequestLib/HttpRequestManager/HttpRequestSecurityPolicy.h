//
//  HttpRequestSecurityPolicy.h
//  MobileAcquiringCore
//
//  Created by Alexey on 24.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFSecurityPolicy.h"
#import "HttpRequestSettings.h"

@interface HttpRequestSecurityPolicy : AFSecurityPolicy

+ (AFSecurityPolicy*) initWithSettings:(HttpRequestSettings*)settings;

@end
