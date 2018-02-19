//
//  RestorePasswdAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface RestorePasswdAnswer : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;

@end