//
//  User.h
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UserSex) {
    UserSexUnknown = 0,
    UserSexMale,
    UserSexFemale
};

@interface User : NSObject

@property (nonatomic, retain) NSString* contact;
@property (nonatomic, retain) NSString* password;
@property (nonatomic, retain) NSString* firstName;
@property (nonatomic, retain) NSString* secondName;
@property (nonatomic, retain) NSString* parentName;
@property (nonatomic, retain) NSString* birthDate;
@property (nonatomic)         UserSex   sex;
@property (nonatomic, copy)   NSString* allowProfileView;

-(NSString*) getStringSexValue;
-(void) setStringSexValue:(NSString*)newSexvalue;

@end
