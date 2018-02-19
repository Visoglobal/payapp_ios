//
//  SenderInfo.h
//  PayApp
//
//  Created by Alexey on 23.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface SenderInfo : BaseRequestModel

@property (nonatomic, copy) NSString* cardId;
@property (nonatomic, copy) NSString* pan;

@end
