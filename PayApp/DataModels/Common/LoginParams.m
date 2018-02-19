//
//  LoginParams.m
//  PayApp
//
//  Created by Alexey on 03.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "LoginParams.h"

@implementation LoginParams

-(NSString*)rootName
{
    return @"LoginParams";
}

- (NSDictionary*) mapProperties
{
    return @{
             @"MinFee": @"minFee",
             @"Fee": @"feeValue",
             @"Currency": @"currency",
             @"UserDefaultCardId": @"userDefaultCardId"
             };
}

- (NSDictionary *)mapClasses
{
    return @{ };
}

@end
