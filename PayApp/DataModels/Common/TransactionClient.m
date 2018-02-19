//
//  TransactionClient.m
//  PayApp
//
//  Created by Alexey on 08.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "TransactionClient.h"
#import "UserManager.h"

@implementation TransactionClient

-(NSString*)rootName
{
    return @"Sender";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"client",
                                                        @"own",
                                                        @"comment"
                                                        ] forKeys:  @[
                                                                      @"Client",
                                                                      @"Own",
                                                                      @"Comment"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"Client": [ClientView class],
                                   @"Own": [OwnView class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}

-(NSString*)userFullName
{
    NSString* fullNAme = nil;
    if(_own)
        fullNAme = [NSString stringWithFormat:@"%@ %@", USER_MANAGER.contact.firstName, USER_MANAGER.contact.secondName];
    if (_client)
        fullNAme = [NSString stringWithFormat:@"%@ %@", _client.name?_client.name:@"", _client.familyName?_client.familyName:@""];
    
    return fullNAme;
}

@end


