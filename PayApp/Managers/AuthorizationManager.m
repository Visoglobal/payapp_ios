//
//  AuthorizationManager.m
//  
//
//  Created by Alexey on 21.10.15.
//
//

#import "AuthorizationManager.h"
#import "CheckLoginRequest.h"
#import "LoginRequest.h"
#import "LoginAnswer.h"
#import "ClientRegisterRequest.h"
#import "ClientRegisterAnswer.h"
#import "UserManager.h"
#import "RestorePasswdRequest.h"
#import "RestorePasswdAnswer.h"
#import "ClientRegisterFinRequest.h"
#import "ClientRegisterFinAnswer.h"
#import "ContactConfirmFinAnswer.h"
#import "ContactConfirmFinRequest.h"
#import "ContactConfirmInitRequest.h"
#import "ContactConfirmInitAnswer.h"

@implementation AuthorizationManager

+ (instancetype) sharedAuthorizationManager
{
    static AuthorizationManager * _sharedAuthorizationManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedAuthorizationManager = [[AuthorizationManager alloc] init];
    });
    
    return _sharedAuthorizationManager;
}

- (void) checkLogin:(NSString*)login withCompletion:(void (^)(CheckLoginArswer* loginAnswer,  NSError *error))completion
{    
    CheckLoginRequest* chkLoginRqst = [CheckLoginRequest new];
    chkLoginRqst.requestId = @"1";
    chkLoginRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    chkLoginRqst.login = login;
    
    [requestManager sendRequest:chkLoginRqst complete:^(id responseObject, NSError *error) {
        CheckLoginArswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[CheckLoginArswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
        }
    
        if (completion)
            completion(answer, error);
    }];
}

- (void) authorizeWithLogin:(NSString*)login andPassword:(NSString*)password andCompletion:(void (^)(NSError *error))completion
{
    __block LoginRequest* loginRqst = [LoginRequest new];
    loginRqst.requestId = @"1";
    loginRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    
    loginRqst.login = login;
    loginRqst.password = password;
    loginRqst.device = USER_MANAGER.userDevice;
    
    [requestManager sendRequest:loginRqst complete:^(id responseObject, NSError *error) {
        LoginAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[LoginAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            
            if (!error){
                if(![USER_MANAGER.contact.contact isEqualToString:loginRqst.login])
                {
                    [USER_MANAGER clearUserData];
                }
                USER_MANAGER.serverDate = answer.serverDate;
                USER_MANAGER.sessionId = answer.sessionId;
                USER_MANAGER.contact.contact = loginRqst.login;
                USER_MANAGER.expiryDate = @"";
                USER_MANAGER.allowFinance = answer.toDo.allowFinance;
                
                USER_MANAGER.currency = answer.loginParams.currency;
                USER_MANAGER.transactionMinFeeValue = answer.loginParams.minFee;
                USER_MANAGER.transactionFee = answer.loginParams.feeValue;
                USER_MANAGER.userDefaultCardId = answer.loginParams.userDefaultCardId;
                
                [USER_MANAGER saveUserData];
            }
        }
        
        if (completion)
            completion(error);
    }];
}

-(void) registrNewClientWithLogin:(NSString*)login
                      andPassword:(NSString*)password
                       familyName:(NSString*)familyName
                             name:(NSString*)name
                       parentName:(NSString*)parentName
                        birthDate:(NSString*)birthDate
                              sex:(NSString*)sex
                 allowProfileView:(NSString*)allowProfileView andCompletion:(void (^)(NSError *error))completion
{
    
    __block ClientRegisterRequest* regRqst = [ClientRegisterRequest new];
    regRqst.requestId = @"1";
    regRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    regRqst.login = login;
    regRqst.password = password;
    regRqst.familyName = familyName;
    regRqst.name = name;
    regRqst.parentName = parentName;
    regRqst.birthDate = birthDate;
    regRqst.sex = sex;
    regRqst.allowProfileView = allowProfileView;
    
    regRqst.device = USER_MANAGER.userDevice;
    
    [requestManager sendRequest:regRqst complete:^(id responseObject, NSError *error) {
        ClientRegisterAnswer* answer;
        
        if (!error && responseObject)
        {
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            if (!error)
            {
                answer = [[ClientRegisterAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
                USER_MANAGER.serverDate = answer.serverDate;
                USER_MANAGER.sessionId = answer.sessionId;
                USER_MANAGER.expiryDate = answer.expiryDate;
                USER_MANAGER.allowFinance = answer.toDo.allowFinance;
                
                USER_MANAGER.contact.contact = answer.contact;
                USER_MANAGER.contact.password = regRqst.password;
                USER_MANAGER.contact.firstName = regRqst.name;
                USER_MANAGER.contact.secondName = regRqst.familyName;
                USER_MANAGER.contact.parentName = regRqst.parentName;
                USER_MANAGER.contact.birthDate = regRqst.birthDate;
                [USER_MANAGER.contact setStringSexValue:regRqst.sex];
                USER_MANAGER.contact.allowProfileView = regRqst.allowProfileView;
                
                USER_MANAGER.currency = answer.loginParams.currency;
                USER_MANAGER.transactionMinFeeValue = answer.loginParams.minFee;
                USER_MANAGER.transactionFee = answer.loginParams.feeValue;
                USER_MANAGER.userDefaultCardId = answer.loginParams.userDefaultCardId;
                
                [USER_MANAGER saveUserData];
            }
            
        }
        
        if (completion)
            completion(error);
    }];

}

-(void) finalRegistrNewClientWithLogin:(NSString*)login
                          andPassword:(NSString*)password
                          comfirmCode:(NSString*)comfirmCode
                           familyName:(NSString*)familyName
                                 name:(NSString*)name
                           parentName:(NSString*)parentName
                            birthDate:(NSString*)birthDate
                                  sex:(NSString*)sex
                     allowProfileView:(NSString*)allowProfileView andCompletion:(void (^)(NSError *error))completion
{
    
    ClientRegisterFinRequest* regRqst = [ClientRegisterFinRequest new];
    regRqst.requestId = @"1";
    regRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    regRqst.login = login;
    regRqst.password = password;
    regRqst.verifyCode = comfirmCode;
    regRqst.familyName = familyName;
    regRqst.name = name;
    regRqst.parentName = parentName;
    regRqst.birthDate = birthDate;
    regRqst.sex = sex;
    regRqst.allowProfileView = allowProfileView;
    regRqst.device = USER_MANAGER.userDevice;
    
    [requestManager sendRequest:regRqst complete:^(id responseObject, NSError *error) {
        ClientRegisterFinAnswer* answer;
        
        if (!error && responseObject)
        {
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            if (!error)
            {
                answer = [[ClientRegisterFinAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
                USER_MANAGER.serverDate = answer.serverDate;
                USER_MANAGER.sessionId = answer.sessionId;
                USER_MANAGER.expiryDate = @"";
                USER_MANAGER.allowFinance = answer.toDo.allowFinance;
            }
        }
        
        if (completion)
            completion(error);
    }];
    
}

-(void) contactConfirmWithCode:(NSString*)confirmCode andCompletion:(void (^)(NSError *error))completion
{
    
    ContactConfirmFinRequest* regRqst = [ContactConfirmFinRequest new];
    regRqst.requestId = @"1";
    regRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    regRqst.sessionId = USER_MANAGER.sessionId;
    regRqst.verifyCode = confirmCode;
    
    [requestManager sendRequest:regRqst complete:^(id responseObject, NSError *error) {

        ContactConfirmFinAnswer* answer;
        
        if (!error && responseObject)
        {
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            if (!error)
            {
                answer = [[ContactConfirmFinAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
                USER_MANAGER.serverDate = answer.serverDate;
                USER_MANAGER.expiryDate = @"";
                USER_MANAGER.allowFinance = answer.toDo.allowFinance;
            }
        }
        
        if (completion)
            completion(error);
    }];
    
}

- (void) restorePasswordForLogin:(NSString*)login withCompletion:(void (^)(NSError *error))completion
{
    RestorePasswdRequest* restoreRqst = [RestorePasswdRequest new];
    restoreRqst.requestId = @"1";
    restoreRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    restoreRqst.login = login;
    
    [requestManager sendRequest:restoreRqst complete:^(id responseObject, NSError *error) {
        RestorePasswdAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault = [[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            if (!error)
                answer = [[RestorePasswdAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
        }
        
        if (completion)
            completion(error);
    }];
}

- (void) updateConfirmCodeForLogin:(NSString*)login withCompletion:(void (^)(NSError *error))completion
{
    ContactConfirmInitRequest* restoreRqst = [ContactConfirmInitRequest new];
    restoreRqst.requestId = @"1";
    restoreRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    restoreRqst.contact = login;
    
    [requestManager sendRequest:restoreRqst complete:^(id responseObject, NSError *error) {
        ContactConfirmInitAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            if (!error)
            {
                answer = [[ContactConfirmInitAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
                
                USER_MANAGER.serverDate = answer.serverDate;
                USER_MANAGER.expiryDate = answer.verifyExpiryDate;
                USER_MANAGER.contact.contact = answer.contact;
                
                [USER_MANAGER saveUserData];
            }
        }
        
        if (completion)
            completion(error);
    }];
}

@end
