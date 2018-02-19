//
//  UpdateManager.h
//  PayApp
//
//  Created by Alexey on 20.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"

#define UPDATE_MANAGER [UpdateManager sharedUpdateManager]

@interface UpdateManager : BaseManager

+ (instancetype) sharedUpdateManager;
- (void) updateAppBaseDataWithCompletion:(void (^)())completion;
@end
