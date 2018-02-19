//
//  ClientViewAnswer.m
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "ClientViewAnswer.h"
#import "DeviceHelper.h"

@implementation ClientViewAnswer

-(NSString*)rootName
{
    return @"ClientViewRs";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"requestId",
                                                        @"serverDate",
                                                        @"toDo",
                                                        @"allowProfileView",
                                                        @"birthDate",
                                                        @"contactList",
                                                        @"name",
                                                        @"familyName",
                                                        @"parentName",
                                                        @"sex",
                                                        @"clientId",
                                                        @"device"
                                                        ] forKeys:  @[
                                                                      @"RequestId",
                                                                      @"ServerDate",
                                                                      @"ToDo",
                                                                      @"AllowProfileView",
                                                                      @"BirthDate",
                                                                      @"ContactList",
                                                                      @"Name",
                                                                      @"FamilyName",
                                                                      @"ParentName",
                                                                      @"Sex",
                                                                      @"ClientId",
                                                                      @"Device"
                                                                      ]];
    
}

//-(void)setUserPhotoBase64String:(NSString *)userPhotoBase64String
//{
//    if (userPhotoBase64String)
//    {
//        NSData *data;
//        if ([DeviceHelper isIOS7])
//            data = [[NSData alloc]initWithBase64EncodedString:userPhotoBase64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        else
//            data = [[NSData alloc] initWithBase64Encoding:userPhotoBase64String];
//        
//        _userPhoto = [UIImage imageWithData:data];
//    }
//}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{
                                   @"ToDo": [ToDo class],
                                   @"ContactList":[ContactList class],
                                   @"Device": [Device class]
                                   };
}

-(NSArray*) attributes
{
    return nil;
}

@end