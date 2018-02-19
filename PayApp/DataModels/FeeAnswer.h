//
//  WebFeeAnswer.h
//  PayApp
//
//  Created by Alexey on 20.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"

@interface FeeAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, copy) NSString* feeAmount;

@end
