//
//  ToDo.m
//  PayApp
//
//  Created by Alexey on 10.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

-(BOOL)allowFinance
{
    if (isAllowFinance && [isAllowFinance isEqualToString:@"true"])
        return YES;
    
    return NO;
}

-(NSString*)rootName
{
    return @"ToDo";
}

- (NSDictionary*) mapProperties
{
    return @{
             @"VerifyContact": @"verifyContact",
             @"ConfirmMoneySend": @"confirmMoneySend",
             @"ConfirmMoneyReceive": @"confirmMoneyReceive",
             @"HasTrNews": @"hasTransactionNews",
             @"AllowFinance": @"isAllowFinance"
             };
}

- (NSDictionary *)mapClasses
{
    return @{ };
}

@end
