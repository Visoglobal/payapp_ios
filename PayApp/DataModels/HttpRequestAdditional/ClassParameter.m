//
//  ClassParameter.m
//  
//
//  Created by Alexey on 22.10.15.
//
//

#import "ClassParameter.h"

@implementation ClassParameter

-(id)initWithParamName:(NSString*)paramName andValue:(NSString*)paramValue{
     if (self = [self init]) {
         self.parameterName = paramName;
         self.parameterValue = paramValue;
     }
     return self;
}
                           
                           
@end
