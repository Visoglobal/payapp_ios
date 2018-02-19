//
//  ClientManager.h
//  PayApp
//
//  Created by Alexey on 14.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"

#define CLIENT_MANAGER [ClientManager sharedClientManager]

@interface ClientManager : BaseManager

+ (instancetype) sharedClientManager;
- (void) getClientViewWithCompletion:(void (^)(id clientViewAnswer,  NSError *error))completion;
- (void) getClientList:(NSArray*)clientList
        withCompletion:(void (^)(id clientListAnswer,  NSError *error))completion;
- (void) getAllContactsWithCompletion:(void (^)(NSArray* contacts))completion;

- (void) addClient:(NSString*)client withCompletion:(void (^)(id addClientAnswer,  NSError *error))completion;

- (void) editClientWithName:(NSString*)name
                 familyName:(NSString*)familyName
                 parentName:(NSString*)parentName
                  birthDate:(NSString*)birthDate
                        sex:(NSString*)sex
           allowProfileView:(NSString*)allowProfileView
          base64imageString:(NSString*)base64imageString
             withCompletion:(void (^)(NSError *error))completion;
@end
