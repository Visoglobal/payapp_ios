//
//  Device.h
//  PayApp
//
//  Created by Alexey on 31.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface Device : BaseRequestModel

@property (nonatomic, copy)     NSString* deviceToken;
@property (nonatomic, copy)     NSString* deviceType;

@end

