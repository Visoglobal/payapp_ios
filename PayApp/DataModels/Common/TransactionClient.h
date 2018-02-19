//
//  TransactionClient.h
//  PayApp
//
//  Created by Alexey on 08.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "ClientView.h"
#import "OwnView.h"

@interface TransactionClient : BaseRequestModel

@property (nonatomic, retain) ClientView* client;
@property (nonatomic, retain) OwnView*   own;
@property (nonatomic, copy) NSString* comment;

@property (nonatomic, assign) NSString* userFullName;
@end
