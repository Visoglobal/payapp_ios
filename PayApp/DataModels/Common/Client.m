//
//  Client.m
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import "Client.h"
#import "DeviceHelper.h"

@implementation Client

-(BOOL)needRegisterFin
{
    return (_isNeedRegisterFin && [_isNeedRegisterFin isEqualToString:@"true"])?YES:NO;
}

-(void)setNeedRegisterFin:(BOOL)needRegisterFin
{
    _isNeedRegisterFin = needRegisterFin?@"true":@"false";
}

//-(UIImage*)userPhoto
//{
//    NSData *data;
//    if (userPhotoBase64String) {
//        if ([DeviceHelper isIOS7])
//            data = [[NSData alloc]initWithBase64EncodedString:userPhotoBase64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        else
//            data = [[NSData alloc] initWithBase64Encoding:userPhotoBase64String];
//
//    }
//    
//    return [UIImage imageWithData:data];
//}
//
//-(void)setUserPhoto:(UIImage *)userPhoto
//{
//    if (!userPhoto)
//    {
//        userPhotoBase64String = nil;
//        return;
//    }
//    
//    if ([DeviceHelper isIOS7])
//       userPhotoBase64String = [UIImagePNGRepresentation(userPhoto) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    else
//    {
//        NSData *decodedData = [[NSData alloc] initWithData:UIImagePNGRepresentation(userPhoto)];
//        userPhotoBase64String = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
//    }
//}

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

-(NSString*)rootName
{
    return @"Client";
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
                                                        @"contact",
                                                        @"isNeedRegisterFin"
                                                        ] forKeys:  @[
                                                                      @"ClientId",
                                                                      @"FamilyName",
                                                                      @"Name",
                                                                      @"ParentName",
                                                                      @"BirthDate",
                                                                      @"Sex",
                                                                      @"Contact",
                                                                      @"NeedRegisterFin"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{};
}

-(NSArray*) attributes
{
    return nil;
}



@end
