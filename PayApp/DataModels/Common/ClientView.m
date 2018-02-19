//
//  ClientView.m
//  PayApp
//
//  Created by Alexey on 08.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ClientView.h"

@implementation ClientView

-(NSString*)rootName
{
    return @"ClientView";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"clientId",
                                                        @"familyName",
                                                        @"name",
                                                        @"parentName",
                                                        @"birthDate",
                                                        @"sex",
                                                        @"contactList",
                                                        @"needRegisterFin"
                                                        ] forKeys:  @[
                                                                      @"ClientId",
                                                                      @"FamilyName",
                                                                      @"Name",
                                                                      @"ParentName",
                                                                      @"BirthDate",
                                                                      @"Sex",
                                                                      @"ContactList",
                                                                      @"NeedRegisterFin"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                @"ContactList": [ContactList class]
             };
}

-(NSArray*) attributes
{
    return nil;
}


@end