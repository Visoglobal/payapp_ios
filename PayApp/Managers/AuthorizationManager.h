//
//  AuthorizationManager.h
//  
//
//  Created by Alexey on 21.10.15.
//
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "CheckLoginArswer.h"

#define AUTHORIZATION_MANAGER [AuthorizationManager sharedAuthorizationManager]

@interface AuthorizationManager : BaseManager

+ (instancetype) sharedAuthorizationManager;

- (void) checkLogin:(NSString*)login withCompletion:(void (^)(CheckLoginArswer* loginAnswer,  NSError *error))completion;
- (void) authorizeWithLogin:(NSString*)login andPassword:(NSString*)password andCompletion:(void (^)(NSError *error))completion;
- (void) registrNewClientWithLogin:(NSString*)login andPassword:(NSString*)password familyName:(NSString*)familyName name:(NSString*)name
                       parentName:(NSString*)parentName birthDate:(NSString*)birthDate sex:(NSString*)sex allowProfileView:(NSString*)allowProfileView andCompletion:(void (^)(NSError *error))completion;
- (void) finalRegistrNewClientWithLogin:(NSString*)login andPassword:(NSString*)password comfirmCode:(NSString*)comfirmCode familyName:(NSString*)familyName
                                   name:(NSString*)name parentName:(NSString*)parentName birthDate:(NSString*)birthDate sex:(NSString*)sex allowProfileView:(NSString*)allowProfileView andCompletion:(void (^)(NSError *error))completion;

- (void) contactConfirmWithCode:(NSString*)confirmCode andCompletion:(void (^)(NSError *error))completion;

- (void) restorePasswordForLogin:(NSString*)login withCompletion:(void (^)(NSError *error))completion;
- (void) updateConfirmCodeForLogin:(NSString*)login withCompletion:(void (^)(NSError *error))completion;

@end
