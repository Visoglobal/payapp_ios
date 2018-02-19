//
//  ClassParameter.h
//  
//
//  Created by Alexey on 22.10.15.
//
//

#import <Foundation/Foundation.h>

@interface ClassParameter : NSObject

@property (nonatomic, retain) NSString* parameterValue;
@property (nonatomic, retain) NSString* parameterName;

-(id)initWithParamName:(NSString*)paramName andValue:(NSString*)paramValue;

@end
