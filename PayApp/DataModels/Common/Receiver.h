//
//  Receiver.h
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sender.h"

@interface Receiver : Sender

@property (nonatomic, copy) NSString* clientId;
@property (nonatomic, copy) NSString* contact;

@end
