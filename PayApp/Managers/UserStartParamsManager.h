//
//  UserStartParamsManager.h
//  PayApp
//
//  Created by Alexey on 04.04.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "CheckLoginArswer.h"

#define USER_START_PARAMS_MANAGER [UserStartParamsManager sharedUserStartParamsManager]

@interface UserStartParamsManager : BaseManager

+ (instancetype) sharedUserStartParamsManager;
- (void) updateUserInitDataWithCompletion:(void (^)(NSError *error))completion;

@end