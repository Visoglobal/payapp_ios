//
//  BaseDataModel.h
//  PayApp
//
//  Created by Alexey on 14.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerDataModel.h"

@interface BaseRequestDataModel : BaseAnswerDataModel

- (NSDictionary*)dictionaryFromClass;

@end
