//
//  LoginParams.h
//  PayApp
//
//  Created by Alexey on 03.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"

@interface LoginParams : BaseAnswerModel

@property (nonatomic, copy) NSString* minFee;
@property (nonatomic, copy) NSString* feeValue;
@property (nonatomic, copy) NSString* currency;
@property (nonatomic, copy) NSString* userDefaultCardId;

@end
