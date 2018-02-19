//
//  User.m
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "User.h"

@implementation User

- (void)encodeWithCoder:(NSCoder *)encoder
{
        [encoder encodeObject:_contact forKey:@"contact"];
        [encoder encodeObject:_password forKey:@"password"];
        [encoder encodeObject:_firstName forKey:@"firstName"];
        [encoder encodeObject:_secondName forKey:@"secondName"];
        [encoder encodeObject:_parentName forKey:@"parentName"];
        [encoder encodeObject:_birthDate forKey:@"birthDate"];
        [encoder encodeObject:_allowProfileView forKey:@"allowProfileView"];
        [encoder encodeInt:_sex forKey:@"sex"];
    
}


- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if( self != nil )
    {
        _contact          = [decoder decodeObjectForKey:@"contact"];
        _password         = [decoder decodeObjectForKey:@"password"];
        _firstName        = [decoder decodeObjectForKey:@"firstName"];
        _secondName       = [decoder decodeObjectForKey:@"secondName"];
        _parentName       = [decoder decodeObjectForKey:@"parentName"];
        _birthDate        = [decoder decodeObjectForKey:@"birthDate"];
        _allowProfileView = [decoder decodeObjectForKey:@"allowProfileView"];
        _sex              = [decoder decodeIntForKey:@"sex"];
        
        
    }
    return self;
}

-(NSString*)firstName
{
    if (_firstName)
        return _firstName;
    return @"";
}

-(NSString*)secondName
{
    if (_secondName)
        return _secondName;
    return @"";
}

-(NSString*) getStringSexValue
{
    if (self.sex == UserSexFemale)
        return @"female";
    
    if (self.sex == UserSexMale)
        return @"male";
    
    return @"unknown";
}

-(void) setStringSexValue:(NSString*)newSexvalue
{
    if (newSexvalue)
    {
        if([newSexvalue isEqualToString:@"female"])
        {
            self.sex = UserSexFemale;
            return;
        }
         if([newSexvalue isEqualToString:@"male"])
         {
            self.sex = UserSexMale;
            return;
         }
    }
    
    self.sex = UserSexUnknown;
}


@end
